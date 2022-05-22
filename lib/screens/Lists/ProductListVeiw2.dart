import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/screens/Details/ProductDetails/productDetail.dart';
import 'package:green_impact_app/screens/Lists/productList.dart';
import 'package:green_impact_app/screens/Items/ProductItem.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ProductListVeiw2 extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  //List<Product> prod = Product.generateOliveOilProducts();

  //final ListOFProducts prodList;
  ProductListVeiw2(this.selected, this.callback, this.pageController);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: FutureBuilder(
        future: getproducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text(''),
            );
          } else {
            final prodList = snapshot.data! as ListOFProducts;
            final prList = prodList.productsList.keys.toList();
            return PageView(
                controller: pageController,
                onPageChanged: (index) => callback(index),
                children: prList
                    .map((e) => ListView.separated(
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        prodList.productsList[
                                            prList[selected]]![index])));
                              },
                              child: ProductItem(prodList
                                  .productsList[prList[selected]]![index]),
                            ),
                        separatorBuilder: (_, index) => SizedBox(height: 13),
                        itemCount:
                            prodList.productsList[prList[selected]]!.length))
                    .toList());
          }
        },
      ),
    );
  }

  static final List<Product> Olive = [];
  static final List<Product> juices = [];
  static final List<Product> Honey = [];
  static final List<Product> Milk = [];
  static final List<Product> Coffee = [];
  static final List<Product> GAndS = [];
  static final List<Product> spices = [];
  static final List<Product> Sauses = [];
  static final List<Product> Breakfast = [];
  static final List<Product> rice = [];
  static final List<Product> Tea = [];

  static final List<Product> NoOFBLi = [];

//Grains & Seeds
  static Future<ListOFProducts> getproducts() async {
    List<String> cat = [
      'Honey',
      'Spices',
      'Oil',
      'Sauces',
      'Breakfast',
      'Rice',
      'Grains',
      'juices',
      'Tea',
      'coffee',
      'Milk'
    ];
    Map<String, List<Product>> c = {};
    List<Badge> Badg = [
      Badge(
          "assets/images/vegan.png",
          "Vegan is awarded products that cannot have been brought to market at the cost of animal lives or comfort, or products that have used animal products during their processing",
          "Vegan",
          "0"),
      Badge(
          "assets/images/greenpackaging.png",
          "Uses material and manufacturing techniques to diminish energy use and reduce the harmful impacts of packaging on the environment. Green packaging is awarded products which meet our packaging criteria. these are products with less packaging, recyclable, glass containers or BPA-free bottles.",
          "Green Packaging",
          "1"),
      Badge(
          "assets/images/nonGMO.png",
          "Non-GMO” means that the food is made without ingredients that where derived from genetically engineered organisms. Meat, poultry, dairy and eggs with a “non-GMO” label are from animals that were not fed and engineered crops. diet containing genetically Non-GMO is awarded to products which meet our Non-GMO criteria.",
          "NON-GMO",
          "2"),
      Badge(
          "assets/images/organic.png",
          "Organic is awarded to products which meet our Organic criteria. Which are: - Grown with natural fertilizers. - Livestock are given all organic, hormone- and GMO-free feed. - Produced using allowed substances. - Produced using agricultural production practices that foster resource cycling. - Products certified Organic.",
          "Organic",
          "3"),
      Badge(
          "assets/images/gluten-free.png",
          "Gluten is protein found in wheat, barley, rye and triticale (a cross between wheat and rye). A gluten-free is essential for managing signs and symptoms of celiac disease and other medical conditions associated with gluten. Gluten-free is awarded to products which meet our gluten-free criteria. Which are: 1. Is inherently gluten-free AND the amount of gluten in the food is less than 20 ppm 2. Contains a gluten-containing grain (wheat, rye, or barley or a crossbreed like triticale) or an ingredient derived from a gluten-containing grain AND has been processed to contain less than 20 parts per million (ppm) of gluten. 3. Products certified gluten-free.",
          "Gluten-Free",
          "4"),
      Badge("assets/images/Local.png",
          "Product made by Saudi brand are awarded local.", "Local", "5")
    ];

    for (var item in cat) {
      QueryBuilder<ParseObject> queryp =
          QueryBuilder<ParseObject>(ParseObject('Products'))
            ..whereContains('PCategory', item);
      queryp.keysToReturn([
        'RelatedBadges',
        'PImg',
        'PName',
        'PDesc',
        'PCategory',
        'FavList',
        'location'
      ]);
      final ParseResponse apiResponsep = await queryp.query();

      if (apiResponsep.success && apiResponsep.results != null) {
        var pp = apiResponsep.results as List<ParseObject>;

        for (var i = 0; i < pp.length; i++) {
          List<Badge> bl = [];
          var b = pp[i].get<List>('RelatedBadges');
          for (var j in b!) {
            for (var bad in Badg) if (j.toString() == bad.indx) bl.add(bad);
          }

          if (item == 'Oil') {
            Olive.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Honey') {
            Honey.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Milk') {
            Milk.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'coffee') {
            Coffee.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'juices') {
            juices.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Spices') {
            spices.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Sauces') {
            Sauses.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Breakfast') {
            Breakfast.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Rice') {
            rice.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Tea') {
            Tea.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          } else if (item == 'Grains') {
            GAndS.add(Product(
                pp[i].get<String>('PImg').toString(),
                pp[i].get<String>('PName').toString(),
                pp[i].get<String>('PDesc').toString(),
                pp[i].get<String>('PCategory').toString(),
                pp[i]['FavList'],
                pp[i].get<String>('location').toString(),
                bl));
          }
        }
      }
      //  c.addAll({item: p});
    }

    return ListOFProducts(
      'Badges',
      'Products are awarded badges. Learn more about how badges are awarded',
      'assets/images/GreenImpactLogo.png',
      {
        'Olive Oil': Olive,
        'Honey': Honey,
        'Milk': Milk,
        'Juices': juices,
      },
    );
  }
}
