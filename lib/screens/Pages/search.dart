// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Lists/listOfProducts.dart';
import 'package:green_impact_app/models/product.dart';
import 'package:green_impact_app/models/badge.dart';
import 'package:green_impact_app/screens/Details/ProductDetails/productDetail.dart';
import 'package:green_impact_app/screens/Pages/home.dart';
import 'package:green_impact_app/screens/Lists/NoOFBadgesLi.dart';
import 'package:green_impact_app/screens/Items/ProductItem.dart';
import 'package:green_impact_app/screens/Lists/ProductListVeiw2.dart';
import 'package:green_impact_app/widgets/CustomAppBar.dart';
import 'package:green_impact_app/widgets/BadgesInfo.dart';
import 'package:green_impact_app/widgets/HomePageHeader.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:green_impact_app/screens/Lists/bList.dart';
import 'package:green_impact_app/screens/Lists/productList.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class SearchPage extends StatefulWidget {
  final List<Product> AllProds = ProductListVeiw2.Olive.toSet().toList() +
      ProductListVeiw2.Milk.toSet().toList() +
      ProductListVeiw2.Honey.toSet().toList() +
      ProductListVeiw2.Coffee.toSet().toList() +
      ProductListVeiw2.GAndS.toSet().toList() +
      ProductListVeiw2.Sauses.toSet().toList() +
      ProductListVeiw2.spices.toSet().toList() +
      ProductListVeiw2.Tea.toSet().toList() +
      ProductListVeiw2.Breakfast.toSet().toList() +
      ProductListVeiw2.rice.toSet().toList() +
      ProductListVeiw2.juices.toSet().toList();

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String text = "";
  static bool _isAllPressed = false;
  static bool _isNamePressed = false;
  static bool _isBadgesPressed = false;
  static bool _isCatPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: BackgroundColor,
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: Search(widget.AllProds));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 10),
                  RaisedButton(
                      child: Text("All"),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          text = "All";
                          _isAllPressed = true;
                          _isNamePressed = false;
                          _isBadgesPressed = false;
                          _isCatPressed = false;
                          //Search(widget.proLi2).suggestionList = SearchPage().proLi2;
                        });
                      }),
                  SizedBox(width: 10),
                  RaisedButton(
                      child: Text("Name"),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          text = 'Name';
                          _isNamePressed = true;
                          _isAllPressed = false;
                          _isBadgesPressed = false;
                          _isCatPressed = false;
                          //Search(widget.proLi2).suggestionList = SearchPage().proLi2;
                        });
                      }),
                  // _singleItem("Name"),
                  SizedBox(width: 10),
                  RaisedButton(
                      child: Text("No Of Badges"),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          text = 'No Of Badges';
                          _isBadgesPressed = true;
                          _isNamePressed = false;
                          _isAllPressed = false;
                          _isCatPressed = false;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NoOfBadgesOrd()));
                          //Search(widget.proLi2).suggestionList = SearchPage().proLi2;
                        });
                      }),

                  //    _singleItem("No Of Badges"),
                  SizedBox(width: 10),
                  RaisedButton(
                      child: Text("Category"),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          text = 'Category';
                          _isCatPressed = true;
                          _isAllPressed = false;
                          _isNamePressed = false;
                          _isBadgesPressed = false;
                          //Search(widget.proLi2).suggestionList = SearchPage().proLi2;
                        });
                      }),
                  // _singleItem("Category"),
                ],
              ),
            ),
          ),
          Container(
            height: 30,
            width: double.infinity,
            color: Colors.white.withOpacity(.99),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 3),
              child: Text(
                "Search By: $text",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
      //column
    );
  }

  Widget _allItems(String searchText) {
    return RaisedButton(
        elevation: 19,
        color: Colors.green.shade300,
        child: Text('All'),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        });
  }

  Widget _singleItem(String searchText) {
    return RaisedButton(
        elevation: 4,
        color: Colors.green.shade300,
        child: Text(searchText),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        });
  }

  bool get isName {
    return _isNamePressed;
  }

  bool get isCat {
    return _isCatPressed;
  }

  bool get isAll {
    return _isAllPressed;
  }

  bool get isB {
    return _isBadgesPressed;
  }
}

class Search extends SearchDelegate {
  final pageController = PageController();
  bool _isNA = _SearchPageState().isName;
  bool _isA = _SearchPageState().isAll;
  bool _isB = _SearchPageState().isB;
  bool _isCa = _SearchPageState().isCat;

  var selected = 0;
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult),
      ),
    );
  }

  //static Future<ListOFProducts> Allprod = ProductListVeiw.getproducts();

  //Future<List<Product>> OliveList = ProductListVeiw.getOliveproducts();
  final List<Product> AllProds2 = ProductListVeiw2.Olive.toSet().toList() +
      ProductListVeiw2.Milk.toSet().toList() +
      ProductListVeiw2.Honey.toSet().toList() +
      ProductListVeiw2.Coffee.toSet().toList() +
      ProductListVeiw2.GAndS.toSet().toList() +
      ProductListVeiw2.Sauses.toSet().toList() +
      ProductListVeiw2.spices.toSet().toList() +
      ProductListVeiw2.Tea.toSet().toList() +
      ProductListVeiw2.Breakfast.toSet().toList() +
      ProductListVeiw2.rice.toSet().toList() +
      ProductListVeiw2.juices.toSet().toList();
  Search(AllProds2);
  List<Product> recentList = [];
  //recentList = recentList.toSet().toList();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Product> suggestionList = [];
    List<Product> suggestionList2 = [];

    suggestionList = suggestionList.toSet().toList();
    if (_isNA) {
      query.isEmpty
          ? suggestionList = recentList.toSet().toList()
          : suggestionList = AllProds2.where((element) => element.productName
              .toLowerCase()
              .contains(query.toLowerCase())).toList();
    } else if (_isCa) {
      query.isEmpty
          ? suggestionList = recentList.toSet().toList()
          : suggestionList = AllProds2.where((element) =>
              element.CategoryLabel.toLowerCase()
                  .contains(query.toLowerCase())).toList();
    } //else if (_isB) {
    //query.isEmpty
    //  ? suggestionList = recentList.toSet().toList()
    // : suggestionList.addAll(AllProds2.where(
    //  (element) => element.AllbadgesList.contains(query.toLowerCase()),
    // ));
    // }
    else if (_isA) {
      query.isEmpty
          ? suggestionList = recentList.toSet().toList()
          : suggestionList = AllProds2.where((element) => element.productName
              .toLowerCase()
              .contains(query.toLowerCase())).toList();
    }

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        selected = index;
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(suggestionList[index]),
                ));
          },
          child: ProductItem(suggestionList[index]),
          // subtitle: Text(
          //   suggestionList[index].productDesc,
          // ),
        );
      },
    );
  }

  //return apiResponse2.results as List<ParseObject>;
}
