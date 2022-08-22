import 'package:bucx_app/providers/brand_list_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

import '../providers/brand_info_provider.dart';
import '../providers/brand_list_provider.dart';
import '../models/brand_list_item.dart';

class StoreIconsbar extends StatelessWidget {
  const StoreIconsbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BrandListItem> brandList = Provider.of<BrandList>(context).brandItems;
    return SizedBox(
      height: 60,
      child: ListView(
        padding: const EdgeInsets.only(left: 15, right: 15),
        scrollDirection: Axis.horizontal,
        children: [
          ...brandList.map((e) {
            StoreCircle element = StoreCircle(
              imageUrl: e.iconLink,
              isActive: e.isActive,
              name: e.name,
              id: e.id,
              add: Provider.of<BrandList>(context).addBrandItem,
              makeActive: Provider.of<BrandList>(context).switchActiveItem,
              setActive: Provider.of<BrandInfo>(context).setActiveBrand,
              fetchActiveBrand:
                  Provider.of<BrandInfo>(context).fetchActiveBrand,
            );
            return element;
          }).toList(),
        ],
      ),
    );
  }
}

class StoreCircle extends StatelessWidget {
  const StoreCircle({
    Key? key,
    this.isActive = false,
    required this.add,
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.makeActive,
    required this.setActive,
    required this.fetchActiveBrand,
  }) : super(key: key);

  final bool isActive;
  final String imageUrl;
  final String name;
  final String id;
  final void Function(String name, String iconLink, String id) add;
  final void Function(String name, String id) makeActive;
  final void Function(String name, String id) setActive;
  final void Function() fetchActiveBrand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        makeActive(name, id);
        setActive(name, id);
        fetchActiveBrand();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: isActive
                ? Theme.of(context).primaryColor
                : lightTheme.colorScheme.onBackground.withOpacity(0.1),
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.fromLTRB(6, 0, 6, 0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
