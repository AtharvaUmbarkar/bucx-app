import 'package:bucx_app/theme.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({
    Key? key,
    required this.title,
    this.hasBackButton = false,
    this.colors = const [Colors.black, Colors.black54],
  }) : super(key: key);
  final bool hasBackButton;
  final String title;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: lightTheme.textTheme.headline5?.copyWith(
            color: colors[0],
          ),
        ),
        if (hasBackButton)
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 14,
              color: colors[1],
            ),
            label: Text(
              'Back',
              style: lightTheme.textTheme.bodyText1?.copyWith(
                color: colors[1],
              ),
            ),
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
            ),
          )
      ],
    );
  }
}
