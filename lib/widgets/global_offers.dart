import 'package:bucx_app/models/offer.dart';
import 'package:bucx_app/providers/brand_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';
import '../widgets/offer_card.dart';
import '../models/offer.dart';

class GlobalOffers extends StatelessWidget {
  const GlobalOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Offer> globalOffers =
        Provider.of<BrandInfo>(context, listen: false).fetchGlobalOffers();
    String iconLink = Provider.of<BrandInfo>(context).iconLink;
    return Expanded(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        decoration: const BoxDecoration(
          color: Color(0x144E5FFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Text(
                    'Ongoing Offers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'See All',
                    style: lightTheme.textTheme.button?.copyWith(
                      color: neutralSwatch.shade400,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: globalOffers.map((e) {
                  OfferCard offerCard = OfferCard(
                    name: e.name,
                    description: e.description,
                    value: e.value,
                    iconLink: iconLink,
                  );
                  return offerCard;
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
