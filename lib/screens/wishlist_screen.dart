import 'package:bucx_app/widgets/offer_card.dart';
import 'package:bucx_app/widgets/title_appbar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  static const routeName = '/wishlist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      body: ColorfulSafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const TitleAppBar(
                title: 'Wishlist',
                hasBackButton: true,
              ),
              Expanded(
                child: ListView(
                  children: List.filled(
                    10,
                    const OfferCard(
                      isFavorite: true,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
