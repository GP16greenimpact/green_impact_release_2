import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/screens/Categories/Breakfast.dart';
import 'package:green_impact_app/screens/Categories/GrainsAndSeeds.dart';
import 'package:green_impact_app/screens/Categories/OliveOil.dart';
import 'package:green_impact_app/screens/Categories/Honey.dart';
import 'package:green_impact_app/screens/Categories//Milk.dart';
import 'package:green_impact_app/screens/Categories//Coffee.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_impact_app/screens/Categories/Rice.dart';
import 'package:green_impact_app/screens/Categories/Sauces.dart';
import 'package:green_impact_app/screens/Categories/Spices.dart';
import 'package:green_impact_app/screens/Categories/Tea.dart';
import 'package:green_impact_app/screens/Categories/juices.dart';

class ProductList extends StatelessWidget {
  final int selected;
  final Function callback;
  //List<Product> prodList = Product.generateOliveOilProducts();
  //final ListOFProducts prodList;
  ProductList(this.selected, this.callback);

  @override
  Widget build(BuildContext context) {
    // final category = prodList.productsList.keys.toList();
    List<Cat> category = <Cat>[
      Cat(title: 'Olive Oil', img: 'assets/images/olive.jpg'),
      Cat(title: 'Milk', img: 'assets/images/MilkBG.png'),
      Cat(title: 'Coffee', img: 'assets/images/CoffeeBG.webp'),
      Cat(title: 'Grains & Seeds', img: 'assets/images/GrainsAndSeedsBG6.png'),
      Cat(title: 'Honey & Jam', img: 'assets/images/HoneyAndJamBG.jpg'),
      Cat(title: 'Spices', img: 'assets/images/SpiceBG.jpg'),
      Cat(
          title: 'Sauces & Condiments',
          img: 'assets/images/SaucesAndCondimentsBG.png'),
      Cat(title: 'Cereals & Bars', img: 'assets/images/CerealsAndBarsBG.jpg'),
      Cat(title: 'Rice & Pasta', img: 'assets/images/RiceAndPastaBG.webp'),
      Cat(title: 'juices', img: 'assets/images/juicesBG.jpg'),
      Cat(title: 'Tea', img: 'assets/images/TeaBG2.jpg'),
    ];

    //return Container(
    // height: 100,
    // padding: EdgeInsets.symmetric(vertical: 30),
    //child: FutureBuilder<ListOFProducts>(
    //  future: ListOFProducts.generateListOFOliveOilProducts(),
    //  builder: (context, snapshot) {
    //  if (!snapshot.hasData) {
    //  return Center(
    //   child: Text("Loading . . ."),
    // );
    //} else {
    return new GridTile(
      child: Expanded(
        child: Container(
          width: 340,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 3, mainAxisSpacing: 5),
              // padding: EdgeInsets.symmetric(horizontal: 25),
              //   scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) => GestureDetector(
                    // onTap: () => callback(index),

                    onTap: () {
                      if (category[index].title == 'Olive Oil') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OliveOil()));
                      } else if (category[index].title == 'Honey & Jam') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Honey()));
                      } else if (category[index].title == 'Milk') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Milk()));
                      } else if (category[index].title == 'Coffee') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Coffee()));
                      } else if (category[index].title == 'Grains & Seeds') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GrainsAndSeeds()));
                      } else if (category[index].title == 'juices') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => juices()));
                      } else if (category[index].title == 'Spices') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Spices()));
                      } else if (category[index].title ==
                          'Sauces & Condiments') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Sauces()));
                      } else if (category[index].title == 'Cereals & Bars') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Breakfast()));
                      } else if (category[index].title == 'Rice & Pasta') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Rice()));
                      } else if (category[index].title == 'Tea') {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Tea()));
                      }
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 99,
                                width: 94,
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  image: DecorationImage(
                                    image: AssetImage(category[index].img),
                                    fit: BoxFit.contain,
                                    colorFilter: ColorFilter.mode(
                                        Colors.white.withOpacity(1),
                                        BlendMode.dstATop),
                                  ),
                                ),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  category[index].title,
                                  style: GoogleFonts.sourceSansPro(
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
                      elevation: 15,
                      margin: EdgeInsets.all(7),
                    ),
                  ),
              //separatorBuilder: (_, index) => SizedBox(width: 20),
              itemCount: category.length),
        ),
      ),
    );
    //}
    // },
    //),
    //);
  }
}

class Cat {
  String title;
  String img;
  Cat({required this.title, required this.img});
}
