import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../widgets/search_bar.dart';
import '../widgets/title_appbar.dart';
import '../widgets/add_card.dart';
import '../widgets/brand_card.dart';

import 'package:provider/provider.dart';
import '../providers/brand_list_provider.dart';
import '../providers/brand_info_provider.dart';
import '../models/brand_list_item.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  static const routeName = '/wallet';

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final ScrollController _scrollController = ScrollController();
  List<double> _offsetY = Colors.primaries.asMap().entries.map((color) {
    return (color.key) * 64.0;
  }).toList();
  bool showOverlay = false;
  double bx1y = 0.35;
  double bx2y = 0.35;

  void _setOffset(int idx, double maxScreenHeight) {
    _scrollController
        .animateTo(
      (idx * 65) - (65 * 4),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    )
        .then((_) {
      setState(() {
        showOverlay = true;
        _offsetY = Colors.primaries.asMap().entries.map((color) {
          return (color.key) * 64.0;
        }).toList();
        bx1y = 0.35;
        bx2y = 0.35;
        if (idx < 3) {
          _offsetY = Colors.primaries.asMap().entries.map((color) {
            if (color.key <= idx) {
              return color.key * 64.0;
            } else {
              return ((color.key - 1) * 64.0) + 190;
            }
          }).toList();
        } else {
          _offsetY.replaceRange(idx, idx + 1, [((idx + 1) * 64.0) - 190]);
        }
        if (idx == 0) {
          bx1y = 0.15;
          bx2y = 0.55;
        } else if (idx == 1) {
          bx1y = 0.25;
          bx2y = 0.45;
        } else if (idx == 3) {
          bx1y = 0.25;
          bx2y = 0.45;
        } else if (idx == (_offsetY.length - 2) &&
            (idx * 65) > maxScreenHeight * 0.425) {
          bx2y = 0.3;
          bx1y = 0.4;
        } else if (idx == (_offsetY.length - 1) &&
            (idx * 65) > maxScreenHeight * 0.425) {
          bx2y = 0.2;
          bx1y = 0.5;
        }
      });
    });
  }

  void _closeOverlay() {
    setState(() {
      showOverlay = false;
      _offsetY = Colors.primaries.asMap().entries.map((color) {
        return (color.key) * 64.0;
      }).toList();
      bx1y = 0.35;
      bx2y = 0.35;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BrandListItem> brandList = Provider.of<BrandList>(context).brandItems;
    return LayoutBuilder(
      builder: (ctx, stackConst) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: TitleAppBar(
                    title: 'Wallet',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: SearchBar(),
                ),
                Expanded(
                  child: Scrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    interactive: true,
                    radius: const Radius.circular(10),
                    trackVisibility: true,
                    thickness: 5,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(right: 15),
                      controller: _scrollController,
                      child: LayoutBuilder(
                        builder: (ctx, constraints) => Stack(
                          children: [
                            // ...Colors.primaries.asMap().entries.map((color) {
                            //   return AnimatedPositioned(
                            //     child: GestureDetector(
                            //       onTap: () {
                            //         if (color.key != 0) {
                            //           _setOffset(
                            //               color.key, stackConst.maxHeight);
                            //         }
                            //       },
                            //       child: (color.key == 0)
                            //           ? AddCardWidget()
                            //           : BrandCard(
                            //               bgColor: color.value,
                            //             ),
                            //     ),
                            //     top: _offsetY[color.key],
                            //     duration: const Duration(milliseconds: 250),
                            //     curve: Curves.easeIn,
                            //     width: constraints.maxWidth,
                            //     height: 192,
                            //   );
                            // }).toList(),
                            const AddCardWidget(),
                            ...brandList.mapIndexed((i, e) {
                              return AnimatedPositioned(
                                child: GestureDetector(
                                  onTap: () {
                                    _setOffset(i + 1, stackConst.maxHeight);
                                  },
                                  child: BrandCard(
                                    bgColor: Colors.primaries[i],
                                    brandName: e.name,
                                    brandId: e.id,
                                  ),
                                ),
                                top: _offsetY[i + 1],
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeIn,
                                width: constraints.maxWidth,
                                height: 192,
                              );
                            }).toList(),
                            Container(
                              height: (Colors.primaries.length - 1) * 65 + 190,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          IgnorePointer(
            ignoring: !showOverlay,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showOverlay ? 1 : 0,
              curve: Curves.easeInOut,
              child: SizedBox(
                height: stackConst.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: _closeOverlay,
                      child: Container(
                        width: double.maxFinite,
                        height: stackConst.maxHeight * bx1y,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF00095B),
                              Color(0x00000000),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // stops: [0.0, 0.4, 0.65, 1.0],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: _closeOverlay,
                      child: Container(
                        width: double.maxFinite,
                        height: stackConst.maxHeight * bx2y,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0x00000000),
                              Color(0xFF00095B),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            // stops: [0.0, 0.4, 0.65, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
