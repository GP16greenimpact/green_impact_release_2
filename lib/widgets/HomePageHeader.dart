import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
