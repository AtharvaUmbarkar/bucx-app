import 'package:bucx_app/screens/home_screen.dart';
import 'package:bucx_app/screens/offers_screen.dart';
import 'package:bucx_app/screens/wallet_screen.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  static const routeName = '/base';

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFE),
      resizeToAvoidBottomInset: false,
      body: ColorfulSafeArea(
        child: IndexedStack(
          children: const [
            HomeScreen(),
            OffersScreen(),
            WalletScreen(),
          ],
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: lightTheme.textTheme.overline,
        unselectedLabelStyle: lightTheme.textTheme.overline,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int idx) {
          setState(() {
            _selectedIndex = idx;
          });
        },
      ),
    );
  }
}
