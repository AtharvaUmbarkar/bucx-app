import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/offer_modal.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    this.name,
    this.description,
    this.value,
    this.iconLink,
    this.isFavorite = false,
  }) : super(key: key);

  final String? name;
  final String? description;
  final String? value;
  final String? iconLink;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          backgroundColor: Colors.white,
          builder: (BuildContext context) {
            return OfferModal(
              name: name,
              description: description,
              value: value,
              iconLink: iconLink,
            );
          },
        )
      },
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        padding: const EdgeInsets.fromLTRB(20, 13, 20, 13),
        decoration: BoxDecoration(
            color: lightTheme.primaryColorDark,
            // color: const Color(0xFF3647E9),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/card_bokeh.png',
              ),
              // opacity: 0.15,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Image.network(
                    (iconLink != null)
                        ? iconLink as String
                        : 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Uber_logo_2018.png/320px-Uber_logo_2018.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (value != null)
                              ? (value as String).toUpperCase()
                              : "50% off".toUpperCase(),
                          style: lightTheme.textTheme.headline6,
                        ),
                        // const Padding(padding: EdgeInsets.all(1)),
                        Text(
                          (name != null) ? (name as String) : "on Uber Rides",
                          style: lightTheme.textTheme.caption,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    color: Colors.white.withOpacity(0.08),
                  ),
                  padding: const EdgeInsets.fromLTRB(11, 6, 11, 6),
                  margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: Text(
                    'Online',
                    style: lightTheme.textTheme.overline,
                  ),
                ),
                SizedBox(
                  width: 28,
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_outline,
                      color: lightTheme.colorScheme.error,
                      size: 16,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 4),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      (description != null)
                          ? (description as String)
                          : 'Get 50% off on Uber rides for two months and more...',
                      style: lightTheme.textTheme.caption,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Center(
                      child: Text(
                        'Details',
                        style: lightTheme.textTheme.overline,
                      ),
                    ),
                  ),
                  // child: TextButton(
                  //   style: TextButton.styleFrom(
                  //     padding: EdgeInsets.zero,
                  //     splashFactory: NoSplash.splashFactory,
                  //     alignment: Alignment.centerLeft,
                  //     elevation: 0,
                  //   ),
                  //   onPressed: () => {},
                  //   child: Text(
                  //     'Details',
                  //     style: lightTheme.textTheme.overline,
                  //   ),
                  // ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: lightTheme.colorScheme.secondaryContainer,
                  ),
                  child: Text(
                    'Expires Soon',
                    style: (lightTheme.textTheme.overline)
                        ?.copyWith(color: Colors.black),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
