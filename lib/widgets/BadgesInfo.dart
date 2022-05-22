import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BadgesInfo extends StatelessWidget {
  final textSty = GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 16,
  ));
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Badges",
                style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Products are awarded badges based on the \nsustainability features they met.",
                    style: textSty,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Learn more about how the badges are awarded:",
                    style: textSty,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
