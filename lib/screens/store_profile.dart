import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../widgets/store_iconsbar.dart';
import '../widgets/store_offers.dart';
import '../widgets/store_title.dart';
import '../widgets/store_card.dart';

class StoreProfileScreen extends StatelessWidget {
  const StoreProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/store-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: ColorfulSafeArea(
        child: Column(
          children: const [
            StoreTitle(),
            StoreIconsbar(),
            StoreCard(),
            StoreOffers(),
          ],
        ),
      ),
    );
  }
}
