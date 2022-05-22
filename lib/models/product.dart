import 'badge.dart';

class Product {
  String productImg;
  String productName;
  String productDesc;
  String CategoryLabel;
  bool favList = false;
  String location;

  List<Badge> AllbadgesList;

  Product(this.productImg, this.productName, this.productDesc,
      this.CategoryLabel, this.favList, this.location, this.AllbadgesList);
}
