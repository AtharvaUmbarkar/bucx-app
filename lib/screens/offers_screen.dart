import 'package:bucx_app/screens/store_profile.dart';
import 'package:flutter/material.dart';

import '../widgets/brand_offer_card.dart';
import '../widgets/search_bar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

  static const routeName = '/offers';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: SearchBar(
              hasFilter: true,
            ),
          ),
          Expanded(
            child: ListView(
              children: List.filled(
                10,
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(StoreProfileScreen.routeName);
                  },
                  child: const BrandOfferCard(
                    name: 'H&M',
                    url:
                        'https://ceowatermandate.org/wp-content/uploads/2017/08/HM.png',
                    offerCount: 7,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
