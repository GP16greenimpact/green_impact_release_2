import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/screens/Pages/addToFav.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_desc_detail.dart';
import 'product_img.dart';
import '';

class ProductDetails extends StatefulWidget {
  final Product prod;
  static final List favL = [].toSet().toList();

  ProductDetails(this.prod);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Icon leftIcon = Icon(Icons.arrow_back_ios_outlined);
    Icon? rightIcon = null;
    bool _isPressed = false;

    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              IconButton(
                icon: leftIcon,
                onPressed: () => {Navigator.of(context).pop()},
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_outline,
                ),
                onPressed: () => {
                  setState(() {
                    _isPressed = true;
                  }),
                  if (this.widget.prod.favList == false)
                    {
                      this.widget.prod.favList = true,
                      ProductDetails.favL.add(this.widget.prod),
                    }
                  else if (this.widget.prod.favList == true)
                    {
                      showAlertDialog(context),
                    }
                },
                // color: !_isPressed ? Colors.white : Colors.red,
              ),
              leftCallBack: () => Navigator.of(context).pop(),
            ),
            ProductImg(widget.prod),
            ProDesc(widget.prod),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("This product is already added to your likes."),
      actions: [
        okButton,
      ],
      // titleTextStyle: GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold),
      //contentTextStyle:
      // GoogleFonts.sourceSansPro(fontWeight: FontWeight.normal),
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
