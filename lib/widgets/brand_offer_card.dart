import 'package:cached_network_image/cached_network_image.dart';

import '../theme.dart';
import 'package:flutter/material.dart';

class BrandOfferCard extends StatelessWidget {
  const BrandOfferCard({
    Key? key,
    required this.url,
    required this.name,
    required this.offerCount,
  }) : super(key: key);

  final String url;
  final String name;
  final int offerCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: neutralSwatch.shade200,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Row(children: [
          CircleAvatar(
            child: CircularProgressIndicator(
              color: lightTheme.colorScheme.secondary,
              strokeWidth: 2,
            ),
            foregroundImage: CachedNetworkImageProvider(
              url,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: lightTheme.textTheme.headline5
                    ?.copyWith(color: Colors.black),
              ),
              Text(
                '$offerCount Offers',
                style: lightTheme.textTheme.overline?.copyWith(
                  color: neutralSwatch.shade400,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
