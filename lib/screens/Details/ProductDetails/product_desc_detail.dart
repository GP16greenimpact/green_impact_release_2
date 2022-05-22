//import 'dart:html';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:share/share.dart';

class ProDesc extends StatelessWidget {
  final Product pro;
  ProDesc(this.pro);

  @override
  Widget build(BuildContext context) {
    int x = pro.AllbadgesList.length;
    String ProLoc = pro.location;
    //String bUrl = pro.AllbadgesList[0].toString();
    final textSty = GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
    ));
    return Container(
      padding: EdgeInsets.all(25),
      color: BackgroundColor,
      child: Column(
        children: [
          Text(
            pro.productName,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton.icon(
                onPressed: //() {},
                    _shareContent,
                icon: Icon(Icons.ios_share_rounded),
                label: Text(
                  'Share',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                color: Colors.white,
              ),
              //RaisedButton.icon(
              // onPressed: () {},
              // icon: Icon(
              //    Icons.favorite_outline,
              //  ),
              // label: Text('Like'),
              //  color: Colors.white,
              //  ),
              //Text(pro.CategoryLabel),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  pro.productDesc,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines: 10,
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: [
            Text(
              'Where you can find this product:',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Text(
              pro.location,
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Awarded Badges: $x',
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 120,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, index) => SizedBox(width: 20),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () => {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              pro.AllbadgesList[index].imgURl,
                              width: 65,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              pro.AllbadgesList[index].badgeName,
                              style: GoogleFonts.lato(),
                            ),
                          ],
                        ),
                      ),
                    ),
                itemCount: pro.AllbadgesList.length),
          ),
          SizedBox(
            height: 1000,
          ),
        ],
      ),
    );
  }

  Widget _buildIConext(IconData icon, Color color, String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.2),
      ),
      child: Row(
        children: [
          RaisedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.share_outlined,
            ),
            label: Text('Share'),
            color: Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  void _shareContent() {
    Share.share(
        'Hey, look at this product I found on Green Impact!' + pro.productName);
  }
}
