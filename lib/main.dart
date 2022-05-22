import 'package:flutter/material.dart';
import 'package:green_impact_app/screens/Pages/addToFav.dart';
import 'package:green_impact_app/screens/Pages/category.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/services.dart';
import 'package:green_impact_app/screens/Pages/home.dart';
import 'package:green_impact_app/constants/colors.dart';
import 'package:green_impact_app/screens/Pages/search.dart';
import 'package:dcdg/dcdg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'SmfxVCwnQJ3W2pQBxqXOSSMCZjUafgiqMuryEsKK';
  final keyClientKey = 'yKFIH5JPY07X27rOhT3ehjUGoxv9hd0hgudbM3oN';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Impact',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Colors.lightGreen,
          ),
      home: MyStatefulWidget(),
      // HomePage(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var x = _selectedIndex;
    if (x == 0) {
      return Scaffold(
          body: Center(
            child: HomePage(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 9),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                //fixedColor: PrimaryColor2,
                unselectedItemColor: Colors.black54,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/category.png'),
                    ),
                    label: 'Categories',
                    // backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                    // backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Likes',
                    // backgroundColor: Colors.white,
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: PrimaryColor2,
                onTap: _onItemTapped,
              ),
            ),
          ));
    } else if (x == 1) {
      return Scaffold(
          body: Center(
            child: Category(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 9),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.black54,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/category.png'),
                    ),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Likes',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: PrimaryColor2,
                onTap: _onItemTapped,
              ),
            ),
          ));
    } else if (x == 2) {
      return Scaffold(
          body: Center(
            child: SearchPage(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 9),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.black54,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                      AssetImage('assets/images/category.png'),
                    ),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Likes',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: PrimaryColor2,
                onTap: _onItemTapped,
              ),
            ),
          ));
    } else if (x == 3) {
      return Scaffold(
          body: Center(
            child: AddToFav(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 9),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              child: BottomNavigationBar(
                unselectedItemColor: Colors.black54,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage('assets/images/category.png'),
                        color: Colors.black54),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Likes',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: PrimaryColor2,
                onTap: _onItemTapped,
              ),
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            // child: _widgetOptions.elementAt(_selectedIndex),
            ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage('assets/images/category.png'),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Likes',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.grey[800],
          onTap: _onItemTapped,
        ),
      );
    }
  }
}
