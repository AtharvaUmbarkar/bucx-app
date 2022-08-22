class BrandListItem {
  String name = "dummy-name";
  String iconLink = "dummy-link";
  String id = "dummy-id";
  bool isActive;

  BrandListItem({
    required this.name,
    required this.iconLink,
    required this.id,
    this.isActive = false,
  });
}
