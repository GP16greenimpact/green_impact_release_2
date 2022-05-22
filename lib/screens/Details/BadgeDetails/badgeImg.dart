import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class BadgeImg extends StatelessWidget {
  final ParseObject b;
  BadgeImg(this.b);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      color: BackgroundColor),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(15),
              width: 250,
              height: 250,
              //decoration: BoxDecoration(
              // shape: BoxShape.circle,
              // boxShadow: [
              //  BoxShadow(
              //   color: Colors.grey.withOpacity(0.3),
              //  offset: Offset(-1, 10),
              //  blurRadius: 10,
              // ),
              // ],
              // ),
              child: Image.asset(
                b.get<String>('BadgeImg')!,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
