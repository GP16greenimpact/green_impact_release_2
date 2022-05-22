import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/screens/Details/ProductDetails/productDetail.dart';
import 'package:green_impact_app/screens/Pages/home.dart';
import 'package:green_impact_app/screens/Pages/search.dart';
import 'package:green_impact_app/screens/Items/ProductItem.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:green_impact_app/widgets/BadgesInfo.dart';
import 'package:green_impact_app/widgets/HomePageHeader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:green_impact_app/screens/Lists/bList.dart';
import 'package:green_impact_app/screens/Lists/productList.dart';

class NoOfBadgesOrd extends StatefulWidget {
  @override
  _NoOfBadgesOrdState createState() => _NoOfBadgesOrdState();
}

class _NoOfBadgesOrdState extends State<NoOfBadgesOrd> {
  var selected = 0;

  //final List<Product> prodList = ProductListVeiw.NoOFBLi.toSet().toList();
  final List<Product> prodList2 = SearchPage().AllProds.toSet().toList();

  // prodList = prodList.toSet().toList();
  @override
  Widget build(BuildContext context) {
    prodList2.reversed;
    prodList2.sort(
        (a, b) => b.AllbadgesList.length.compareTo(a.AllbadgesList.length));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        actions: <Widget>[],
        // CustomAppBar(
        //  IconButton(
        //   icon: Icon(Icons.arrow_back_ios_outlined),
        // onPressed: () => {Navigator.of(context).pop()},
        // ),
        //  IconButton(
        //   icon: Icon(Icons.list_outlined),
        //  onPressed: () => {},
        //  ),
        // leftCallBack: () => Navigator.of(context).pop(),
        //  ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: FutureBuilder<ListOFProducts>(
                  future: ListOFProducts.generateListOFOliveOilProducts(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("Loading . . ."),
                      );
                    } else {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: prodList2.length,
                        itemBuilder: (context, index) {
                          selected = index;
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(prodList2[index]),
                                  ))
                            },

                            child: ProductItem(prodList2[index]),

                            // ListTile(
                            //  leading: Image.asset(prodList[index].productImg),
                            //  title: Text(
                            //   prodList[index].productName,
                            // ),
                            // subtitle: Text(
                            //   suggestionList[index].productDesc,
                            // ),

                            // trailing: Icon(Icons.more_vert),
                            //onTap: () {
                            // Navigator.push(
                            //    context,
                            //   MaterialPageRoute(
                            //  builder: (context) =>
                            //       ProductDetails(prodList[index]),
                            //  ));
                            //},
                            // ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
