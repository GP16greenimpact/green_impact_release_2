import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'badgeDesc.dart';
import 'badgeImg.dart';

class BadgeDetails extends StatelessWidget {
  final ParseObject ba;

  BadgeDetails(this.ba);
  @override
  Widget build(BuildContext context) {
    IconButton leftIcon = IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined),
      onPressed: () => {Navigator.of(context).pop()},
    );
    IconButton? rightIcon = null;
    if (rightIcon != null) {
      return Scaffold(
        backgroundColor: PrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                leftIcon,
                rightIcon,
                leftCallBack: () => Navigator.of(context).pop(),
              ),
              BadgeImg(ba),
              BadgeDesc(ba),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: PrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                leftIcon,
                rightIcon,
                leftCallBack: () => Navigator.of(context).pop(),
              ),
              BadgeImg(ba),
              BadgeDesc(ba),
            ],
          ),
        ),
      );
    }
  }
}
