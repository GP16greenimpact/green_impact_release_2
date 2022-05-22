import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BadgeDesc extends StatelessWidget {
  final ParseObject bad;
  BadgeDesc(this.bad);

  @override
  Widget build(BuildContext context) {
    final textSty = GoogleFonts.lato(
        textStyle: TextStyle(
      fontSize: 16,
      height: 1.4,
    ));
    return Container(
      padding: EdgeInsets.all(25),
      color: BackgroundColor,
      child: Column(
        children: [
          Text(
            bad.get<String>('BadgeName')!,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.green.shade600),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  bad.get<String>('BadgeDesc')!,
                  textAlign: TextAlign.justify,
                  style: textSty,
                  maxLines: 20,
                ),
              )
            ],
          ),
          SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }
}
