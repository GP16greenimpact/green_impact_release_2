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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  var Badgeselected = 0;
  final pageController = PageController();
  List<CardO> cards = <CardO>[
    CardO(title: 'About Us', img: 'assets/images/app_logo3.jpg'),
    //CardO(title: 'Privacy', img: 'assets/images/PrivacyPolicy.png'),
    CardO(title: 'Contact Us', img: 'assets/images/call.png'),
    //CardO(title: 'Terms', img: 'assets/images/GrainsAndSeedsBG6.png'),
  ];

  //final produc1 = ListOFProducts.generateListOFOliveOilProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: BackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePageHeader(),
          //CustomAppBar(
          //  Icons.list_outlined,
          //  Icons.search_outlined,
          //),

          Container(
            child: Expanded(
              child: Column(
                children: [
                  BadgesInfo(),
                  bList(
                    Badgeselected,
                    (int index) {
                      setState(() {
                        Badgeselected = index;
                      });
                      pageController.jumpToPage(index);
                    },
                  ),
                  // ProductList(
                  //selected,
                  //(int index) {
                  // setState(() {
                  //   selected = index;
                  //  });
                  //  pageController.jumpToPage(index);
                  // },
                  // ),
                  // ProductListVeiw2(
                  //  selected,
                  // (int index) {
                  //  setState(() {
                  //    selected = index;
                  //
                  //}
                  //);
                  // },
                  // pageController,
                  // ),
                  Text(
                    '',
                    style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black,
                      //shadows:
                    )),
                  ),
                  GridTile(
                    child: Expanded(
                      child: Container(
                        width: 270,
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 5),
                            // padding: EdgeInsets.symmetric(horizontal: 25),
                            //   scrollDirection: Axis.horizontal,

                            itemBuilder: (context, index) => GestureDetector(
                                  // onTap: () => callback(index),

                                  onTap: () {},
                                  child: Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Column(children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 80,
                                                width: 36,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5, horizontal: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      cards[index].img,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ]),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Center(
                                                child: Text(
                                                  cards[index].title,
                                                  style:
                                                      GoogleFonts.sourceSansPro(
                                                          textStyle: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    //shadows:
                                                  )),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ]),
                                      ]),
                                      elevation: 10,
                                      margin: EdgeInsets.all(7),
                                    ),
                                  ),
                                ),
                            //separatorBuilder: (_, index) => SizedBox(width: 20),
                            itemCount: cards.length),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
        ],
      ),
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

class CardO {
  String title;
  String img;
  CardO({required this.title, required this.img});
}
