import 'package:flutter/material.dart';
import '../models/offer.dart';

class BrandInfo extends ChangeNotifier {
  String _activeBrand = "dummy-brand";
  String _name = "dummy-name";
  String _id = "dummy-id";
  List<Offer> _brandOffers = [];
  List<Offer> _globalOffers = [];
  String _iconLink = "dummy-link";

  String get name {
    return _name;
  }

  String get id {
    return _id;
  }

  List<Offer> get brandOffers {
    return _brandOffers;
  }

  List<Offer> get globalOffers {
    return _globalOffers;
  }

  String get iconLink {
    return _iconLink;
  }

  void setActiveBrand(name, id) {
    _activeBrand = name;
    _name = name;
    _id = id;
    notifyListeners();
  }

  void fetchActiveBrand() {
    //TODO: Make API call to populate BrandInfoItem
    _iconLink =
        'https://cdn.freebiesupply.com/logos/large/2x/dominos-pizza-4-logo-png-transparent.png';
    if (_id == "qwerty1") {
      _brandOffers = [
        Offer(
          name: "name1",
          description: "description1",
          value: "10%",
        ),
        Offer(
          name: "name2",
          description: "description2",
          value: "50%",
        ),
        Offer(
          name: "name3",
          description: "description3",
          value: "Rs.500 Off",
        ),
        Offer(
          name: "name4",
          description: "description4",
          value: "Rs.150 Cashback",
        ),
      ];
    } else if (_id == "qwerty12") {
      _brandOffers = [
        Offer(
          name: "name5",
          description: "description1",
          value: "10%",
        ),
        Offer(
          name: "name6",
          description: "description2",
          value: "50%",
        ),
        Offer(
          name: "name7",
          description: "description3",
          value: "Rs.500 Off",
        ),
        Offer(
          name: "name8",
          description: "description4",
          value: "Rs.150 Cashback",
        ),
      ];
    } else if (_id == "qwerty123") {
      _brandOffers = [
        Offer(
          name: "name9",
          description: "description1",
          value: "10%",
        ),
        Offer(
          name: "name10",
          description: "description2",
          value: "50%",
        ),
        Offer(
          name: "name11",
          description: "description3",
          value: "Rs.500 Off",
        ),
        Offer(
          name: "name12",
          description: "description4",
          value: "Rs.150 Cashback",
        ),
      ];
    }
    notifyListeners();
  }

  List<Offer> fetchGlobalOffers() {
    //TODO: Make API call to fetch global offers
    _iconLink =
        'https://freepngimg.com/save/24210-starbucks-logo-image/408x412';
    _globalOffers = [
      Offer(
        name: "global-offer-1",
        description: "description1",
        value: "90%",
      ),
      Offer(
        name: "global-offer-2",
        description: "description2",
        value: "80%",
      ),
      Offer(
        name: "global-offer-3",
        description: "description3",
        value: "Rs.500 Off",
      ),
      Offer(
        name: "global-offer-4",
        description: "description4",
        value: "Rs.150 Cashback",
      ),
    ];
    return _globalOffers;
  }
}
