import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/screens/Details/ProductDetails/productDetail.dart';
import 'package:green_impact_app/screens/Items/ProductItem.dart';
import 'package:green_impact_app/screens/Lists/ProductListVeiw2.dart';
import 'package:google_fonts/google_fonts.dart';

class juices extends StatefulWidget {
  @override
  _juicesState createState() => _juicesState();
}

class _juicesState extends State<juices> {
  var selected = 0;

  final List<Product> prodList = ProductListVeiw2.juices.toSet().toList();
  // prodList = prodList.toSet().toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        title: Text(
          'Juices',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                        itemCount: prodList.length,
                        itemBuilder: (context, index) {
                          //  selected = index;
                          return GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(prodList[index]),
                                  ))
                            },

                            child: ProductItem(prodList[index]),

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
