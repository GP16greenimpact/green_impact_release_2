import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/screens/Details/ProductDetails/productDetail.dart';
import 'package:green_impact_app/screens/Pages/home.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:green_impact_app/widgets/BadgesInfo.dart';
import 'package:green_impact_app/widgets/HomePageHeader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:green_impact_app/screens/Lists/bList.dart';
import 'package:green_impact_app/screens/Lists/productList.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToFav extends StatefulWidget {
  @override
  _AddToFavState createState() => _AddToFavState();
}

class _AddToFavState extends State<AddToFav> {
  var selected = 0;
  List<dynamic> FavList = ProductDetails.favL;
  // FavList = FavList.toSet().toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 25,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/a5741ea5de057e3e9f9d31b0914fc621c3eb1021.png',
                    width: 55,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    'Green Impact',
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.green[700],
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              "Likes",
              style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: FavList.length,
                itemBuilder: (context, index) {
                  selected = index;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(FavList[index]),
                          ));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(7),
                            width: 110,
                            height: 110,
                            child: Image.asset(
                              FavList[index].productImg,
                              fit: BoxFit.contain,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 20,
                                left: 10,
                                right: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(
                                        FavList[index].productName,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal,
                                          height: 1.5,
                                        ),
                                        maxLines: 2,
                                      )),
                                      SizedBox(width: 18),
                                      IconButton(
                                        icon: new Icon(
                                          Icons.delete,
                                          color: Colors.red.shade600,
                                        ),
                                        onPressed: () => setState(() {
                                          FavList[index].favList = false;
                                          FavList.removeAt(index);
                                        }),
                                      ),
                                      SizedBox(width: 2),
                                    ],
                                  ),
                                  //SizedBox(height: 10),
                                  //Row(
                                  // children: [
                                  // Text(
                                  //   'Awarded Badges: $numOFBadges',
                                  //  style: TextStyle(
                                  //backgroundColor: const Color(0xffC5E3BF),
                                  //  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  //  color: Colors.black87),
                                  //),
                                  // ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      elevation: 7,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
