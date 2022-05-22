import 'package:flutter/material.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final Product prod;

  ProductItem(this.prod);

  @override
  Widget build(BuildContext context) {
    int numOFBadges = prod.AllbadgesList.length;
    return Card(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(7),
            width: 110,
            height: 110,
            child: Image.asset(
              prod.productImg,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        prod.productName,
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                        maxLines: 2,
                      )),
                      SizedBox(width: 18),
                      Image.asset(
                        'assets/images/B$numOFBadges.png',
                        fit: BoxFit.contain,
                        scale: 35,
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
    );
  }
}
