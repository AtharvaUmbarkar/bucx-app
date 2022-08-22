import 'package:bucx_app/screens/profile_screen.dart';
import 'package:bucx_app/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
                child: const CircleAvatar(
                  foregroundImage: AssetImage('assets/images/avatars/1.png'),
                  backgroundColor: Colors.black,
                  maxRadius: 18,
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
              Text(
                "Hi $name",
                style: lightTheme.textTheme.headline5,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(WishlistScreen.routeName);
              },
              splashRadius: 1,
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 20,
              ),
            ),
            SizedBox(
              width: 20,
              height: 20,
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 20,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.fromLTRB(0, 2, 2, 0),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.yellow[700],
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
