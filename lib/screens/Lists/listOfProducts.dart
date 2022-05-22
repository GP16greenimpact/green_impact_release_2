import 'package:flutter/cupertino.dart';

import 'package:green_impact_app/models/product.dart';

class ListOFProducts {
  String name;
  String description;
  String logoURL;
  Map<String, List<Product>> productsList;
  ListOFProducts(
    this.name,
    this.description,
    this.logoURL,
    this.productsList,
  );

  static Future<ListOFProducts> generateListOFOliveOilProducts() async {
    return ListOFProducts(
      'Badges',
      'Products are awarded badges. Learn more about how badges are awarded',
      'assets/images/GreenImpactLogo.png',
      {
        'Olive Oil': [],
        'Honey': [],
        'Milk': [],
      },
    );
  }
}
