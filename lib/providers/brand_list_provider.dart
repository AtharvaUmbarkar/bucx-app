import 'package:flutter/material.dart';
import '../models/brand_list_item.dart';

class BrandList extends ChangeNotifier {
  //TODO: Make an API call to populate this list.
  final List<BrandListItem> _brandItems = [
    BrandListItem(
        name: "abcd1",
        id: "qwerty1",
        isActive: false,
        iconLink:
            'https://freepngimg.com/save/24210-starbucks-logo-image/408x412'),
    BrandListItem(
        name: "abcd2",
        id: "qwerty12",
        isActive: false,
        iconLink:
            'https://image.similarpng.com/very-thumbnail/2021/11/Mcdonalds-logo-on-transparent-background-PNG.png'),
    BrandListItem(
        name: "abcd3",
        id: "qwerty123",
        isActive: false,
        iconLink:
            'https://cdn.freebiesupply.com/logos/large/2x/dominos-pizza-4-logo-png-transparent.png'),
  ];

  List<BrandListItem> get brandItems {
    return [..._brandItems];
  }

  String activeBrand = "dummy-brand";

  void addBrandItem(name, iconLink, id) {
    _brandItems.add(
        BrandListItem(name: name, isActive: false, iconLink: iconLink, id: id));
    notifyListeners();
  }

  void deleteBrandItem(name) {
    _brandItems.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  void switchActiveItem(name, id) {
    activeBrand = name;
    var prevBrand = _brandItems.where((item) => item.isActive == true).toList();
    if (prevBrand.isNotEmpty) prevBrand[0].isActive = false;
    var item = _brandItems.where((item) => item.id == id).toList();
    item[0].isActive = true;
    notifyListeners();
  }
}
