// ignore_for_file: file_names

import 'offer.dart';

class BrandInfoItem {
  String name = "dummy-name";
  String iconLink = "dummy-link";
  List<Offer> offers = [];
  String? id = "dummy-id";

  BrandInfoItem({
    required this.name,
    this.id,
  });
}
