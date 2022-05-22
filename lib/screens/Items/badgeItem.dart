import 'package:flutter/material.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/screens/Details/BadgeDetails/badgeImg.dart';

class BadgetItem extends StatelessWidget {
  final Badge b;

  BadgetItem(this.b);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 110,
            height: 110,
            child: Image.asset(b.imgURl, fit: BoxFit.cover),
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
                      Text(b.badgeName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                          )),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
