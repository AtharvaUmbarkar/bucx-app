import 'package:bucx_app/theme.dart';
import 'package:bucx_app/widgets/title_appbar.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/user-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Column(
                children: [
                  TitleAppBar(
                    title: 'Profile',
                    hasBackButton: true,
                    colors: [Colors.white, primarySwatch.shade200],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        foregroundImage:
                            AssetImage('assets/images/avatars/1.png'),
                        backgroundColor: Colors.black,
                        maxRadius: 27,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child: Text(
                          'Suvigya Vijay',
                          style: lightTheme.textTheme.headline6
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const ProfileListItem(
                            icon: Icons.person_outline,
                            itemName: 'Account',
                            isExpandable: true,
                          ),
                          const ProfileListItem(
                            icon: Icons.sync,
                            itemName: 'Sync',
                            isExpandable: false,
                          ),
                          const ProfileListItem(
                            icon: Icons.credit_card,
                            itemName: 'Transaction History',
                            isExpandable: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: lightTheme.colorScheme.error,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              'Logout',
                              style: lightTheme.textTheme.subtitle1?.copyWith(
                                  color: lightTheme.colorScheme.error),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.itemName,
    this.isExpandable = false,
  }) : super(key: key);

  final bool isExpandable;
  final String itemName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      leading: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: neutralSwatch.shade50,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
        ),
      ),
      title: Text(
        itemName,
        style: lightTheme.textTheme.subtitle1?.copyWith(color: Colors.black),
      ),
      trailing: Icon(
        isExpandable ? Icons.add : Icons.arrow_forward_ios_rounded,
        color: neutralSwatch.shade900,
        size: isExpandable ? 24 : 20,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      expandedAlignment: Alignment.centerLeft,
      childrenPadding: const EdgeInsets.fromLTRB(56, 0, 10, 0),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Text(
            'test 1',
            style: lightTheme.textTheme.button,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Text(
            'test 2',
            style: lightTheme.textTheme.button,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Text(
            'test 3',
            style: lightTheme.textTheme.button,
          ),
        ),
      ],
    );
  }
}
