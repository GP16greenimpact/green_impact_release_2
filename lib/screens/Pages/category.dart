import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:green_impact_app/widgets/BadgesInfo.dart';
import 'package:green_impact_app/widgets/HomePageHeader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:green_impact_app/screens/Lists/ProductListVeiw2.dart';
import 'package:green_impact_app/screens/Lists/bList.dart';
import 'package:green_impact_app/screens/Lists/productList.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var selected = 0;
  var Badgeselected = 0;
  final pageController = PageController();

  //final produc1 = ListOFProducts.generateListOFOliveOilProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: BackgroundColor,
      body:
          //CustomAppBar(
          //  Icons.list_outlined,
          //  Icons.search_outlined,
          //),

          Container(
        child: Column(children: [
          HomePageHeader(),
          SizedBox(height: 20),
          Text(
            "Categories",
            style: GoogleFonts.sourceSansPro(
                textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
          ),
          ProductList(
            selected,
            (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          ProductListVeiw2(
            selected,
            (int index) {
              setState(() {
                selected = index;
              });
            },
            pageController,
          ),
        ]),
      ),

      //FutureBuilder<ListOFProducts>(
      // future: ListOFProducts.generateListOFOliveOilProducts(),
      // builder: (context, snapshot) {
      //   if (!snapshot.hasData) {
      //   return Center(
      //    child: Text("Loading . . ."),
      //   );
      // } else {
      //return

      //}
      // },
      //),
      //Expanded(
      //child:

      // ),
      //Container(
      // padding: EdgeInsets.symmetric(horizontal: 25),
      // height: 60,
      //child: SmoothPageIndicator(
      //  controller: pageController,
      //  count: 3,
      // effect: CustomizableEffect(
      //  dotDecoration: DotDecoration(
      //   width: 8,
      //  height: 8,
      //  color: Colors.grey.withOpacity(0.5),
      //  borderRadius: BorderRadius.circular(8),
      //),
      //  activeDotDecoration: DotDecoration(
      //  width: 10,
      // height: 10,
      //  color: BackgroundColor,
      //  borderRadius: BorderRadius.circular(10),
      // dotBorder: DotBorder(
      //   color: PrimaryColor,
      ///   padding: 2,
      // width: 2,
      //),
      //),
      // ),
      //onDotClicked: (index) => pageController.jumpToPage(index),
      // ),
      //),

      //floatingActionButton: FloatingActionButton(
      //  onPressed: () {},
      //  backgroundColor: PrimaryColor,
      //  elevation: 2,
      // child: Icon(
      // Icons.favorite_outline_sharp,
      //   color: Colors.black,
      //   size: 30,
      //   )),
    );
  }
}
