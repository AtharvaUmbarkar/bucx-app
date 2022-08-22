import 'package:bucx_app/screens/home_screen.dart';
import 'package:bucx_app/screens/offers_screen.dart';
import 'package:bucx_app/screens/profile_screen.dart';
import 'package:bucx_app/screens/store_profile.dart';
import 'package:bucx_app/screens/wallet_screen.dart';
import 'package:bucx_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './theme.dart';
import './screens/base_screen.dart';

import 'package:provider/provider.dart';
import '../providers/brand_info_provider.dart';
import '../providers/brand_list_provider.dart';

void main() {
  runApp(const BucxApp());
}

class BucxApp extends StatelessWidget {
  const BucxApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BrandList()),
        ChangeNotifierProvider(create: (context) => BrandInfo()),
      ],
      child: MaterialApp(
        title: 'Bucx',
        theme: ThemeData(
          primarySwatch: primarySwatch,
          primaryColorDark: primarySwatch.shade600,
          colorScheme: appLightColors,
          textTheme: GoogleFonts.poppinsTextTheme(),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(appLightColors.primary),
            trackBorderColor: MaterialStateProperty.all(neutralSwatch.shade100),
            trackColor: MaterialStateProperty.all(neutralSwatch.shade100),
          ),
        ),
        initialRoute: '/base',
        routes: {
          BaseScreen.routeName: (context) => const BaseScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          OffersScreen.routeName: (context) => const OffersScreen(),
          WalletScreen.routeName: (context) => const WalletScreen(),
          StoreProfileScreen.routeName: (context) => const StoreProfileScreen(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          WishlistScreen.routeName: (context) => const WishlistScreen(),
        },
      ),
    );
  }
}
