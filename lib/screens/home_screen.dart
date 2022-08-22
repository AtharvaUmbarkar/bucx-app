import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../screens/store_profile.dart';
import '../widgets/brand_card.dart';
import '../widgets/home_appbar.dart';
import '../widgets/global_offers.dart';
import '../widgets/search_bar.dart';

import '../providers/brand_info_provider.dart';
import '../providers/brand_list_provider.dart';
import '../models/brand_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    this.hasSMSSynced = true,
    this.topCards = const {'a': 'a'},
  }) : super(key: key);

  static const routeName = '/home';

  final bool hasSMSSynced;
  final Map<String, String> topCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: HomeAppBar(name: 'Suvigya'),
              ),
              SearchBar(),
            ],
          ),
        ),
        Column(
          children: [
            if (topCards.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: AddCardWidget(),
              )
            else
              const SizedBox(
                height: 140,
                width: double.maxFinite,
                child: CardCarousel(),
              ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
          ],
        ),
        if (!hasSMSSynced & Platform.isAndroid)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SyncCard(),
          ),
        const GlobalOffers(),
      ],
    );
  }
}

class CardCarousel extends StatelessWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BrandListItem> brandList = Provider.of<BrandList>(context).brandItems;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        const Padding(padding: EdgeInsets.all(5)),
        //! Changes Here
        ...brandList.map((e) {
          Padding element = Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Provider.of<BrandInfo>(
                  context,
                  listen: false,
                ).setActiveBrand(e.name, e.id);
                Provider.of<BrandList>(
                  context,
                  listen: false,
                ).switchActiveItem(e.name, e.id);
                Provider.of<BrandInfo>(
                  context,
                  listen: false,
                ).fetchActiveBrand();
                // print(Provider.of<BrandInfo>(context, listen: false)
                //     .offers[0]
                //     .name);
                Navigator.of(context).pushNamed(StoreProfileScreen.routeName);
              },
              child: BrandCard(
                bgColor: Colors.green,
                height: 140,
                width: 230,
                multiplier: 0.5,
                textMultiplier: 0.8,
                showDetails: false,
                brandName: e.name,
              ),
            ),
          );
          return element;
        }).toList(),
        const Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }
}

class AddCardWidget extends StatelessWidget {
  const AddCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      dashPattern: const [10, 5, 10, 5, 10, 5],
      strokeWidth: 1.5,
      color: neutralVariantSwatch.shade500,
      child: Container(
        width: double.maxFinite,
        height: 130,
        decoration: BoxDecoration(
          // border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          color: neutralSwatch.shade50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 19,
              backgroundColor: lightTheme.colorScheme.primary,
              child: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 22,
                onPressed: () => {},
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Add card',
                style: lightTheme.textTheme.subtitle1,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SyncCard extends StatelessWidget {
  const SyncCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0x1FD44D2F),
        ),
        borderRadius: BorderRadius.circular(10),
        color: lightTheme.colorScheme.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  'Synchronize your email for rewards & offers',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Flexible(
                flex: 1,
                // margin: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundColor: lightTheme.colorScheme.primary,
                  maxRadius: 19,
                  child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.sync,
                      size: 20,
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            children: [
              SizedBox(
                height: 30,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: neutralSwatch.shade600,
                    elevation: 0,
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  ),
                  child: Text(
                    'Sync now',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 30,
                margin: const EdgeInsets.fromLTRB(13, 0, 0, 0),
                child: TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                    elevation: 0,
                    splashFactory: NoSplash.splashFactory,
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Remind Later',
                    style: lightTheme.textTheme.button?.copyWith(
                      color: neutralSwatch.shade400,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  color: Colors.black,
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.help_outline,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
