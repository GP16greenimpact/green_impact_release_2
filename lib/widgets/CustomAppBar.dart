import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconButton leftIcon;
  final IconButton? rightIcon;
  final Function? leftCallBack;
  CustomAppBar(this.leftIcon, this.rightIcon, {this.leftCallBack});

  @override
  Widget build(BuildContext context) {
    if (rightIcon != null) {
      return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftCallBack != null ? () => leftCallBack!() : null,
              child: buildIcon(leftIcon),
            ),
            GestureDetector(
              onTap: () => {},
              child: buildIcon(rightIcon!),
            )
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: leftCallBack != null ? () => leftCallBack!() : null,
              child: buildIcon(leftIcon),
            ),
          ],
        ),
      );
    }
  }

  Widget buildIcon(IconButton icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.3),
      ),
      child: icon,
    );
  }
}
