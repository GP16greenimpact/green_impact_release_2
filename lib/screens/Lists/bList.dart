import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/models/badge.dart';

import 'package:green_impact_app/screens/Details/BadgeDetails/badgeDetail.dart';
import 'package:green_impact_app/screens/Pages/home.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class bList extends StatelessWidget {
  final int selected;
  final Function callback;
  //final PageController pageController;
  //final ListOFBadges bList;

  bList(this.selected, this.callback);

  @override
  Widget build(BuildContext context) {
    Future<List<ParseObject>> GetBadges() async {
      QueryBuilder<ParseObject> queryBadges =
          QueryBuilder<ParseObject>(ParseObject('Badges'));
      final ParseResponse apiResponse = await queryBadges.query();

      if (apiResponse.success && apiResponse.results != null) {
        return apiResponse.results as List<ParseObject>;
      } else {
        return [];
      }
    }

    int isSelected = -1;

    return Expanded(
        child: Container(
      height: 10,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: FutureBuilder<List<ParseObject>>(
        future: GetBadges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading . . ."),
            );
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (_, index) => SizedBox(width: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () // => callback(index),
                    {
                  setState() {
                    if (isSelected == index) {
                      isSelected = 1;
                    } else {
                      isSelected = index;
                    }
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BadgeDetails(snapshot.data![index]),
                    ),
                  );
                },
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Container(
                        height: 145,
                        width: 157,
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(1),
                            )
                          ],
                        ),
                        child: Column(children: [
                          Row(children: [
                            Image.asset(
                              snapshot.data![index].get<String>('BadgeImg')!,
                              width: 155,
                              height: 90,
                            ),
                          ]),
                          Row(
                              //textDirection: TextDirection.values,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data![index]
                                      .get<String>('BadgeName')!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                          SizedBox(
                            height: 18,
                          ),
                          Row(children: [
                            SizedBox(
                              width: 56,
                            ),
                            Text(
                              'Read more..',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              child: Icon(
                                Icons.arrow_forward,
                                size: 13,
                              ),
                              onTap: () => {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        BadgeDetails(snapshot.data![index]),
                                  ),
                                ),
                              },
                            )
                          ]),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              //elevation: 4,
              // margin: EdgeInsets.all(8),
              // margin: EdgeInsets.only(
              //   left: 1.0, top: 5.0, right: 1.0, bottom: 7.0),
            );
          }
        },
      ),
    ));
  }
}
