import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:cric_scorer/Screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> pages = navBarPages;
  Map<String, int> pagesMapper = pagesMapIndex;
  Map<String, List<dynamic>> pageMap = pagesMap;
  List<String> navBarUpdateList = ['feed', 'startMatchRoot', 'profile'];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, data, _) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                data.currentHomePageTitle.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.5,
                ),
              ),
              // centerTitle: true,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              titleSpacing: 25.0,
            ),
            body: pages[data.currentNavBarPageIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: navBarItems,
              currentIndex: currentIndex,
              onTap: (value) {
                setState(() {
                  currentIndex = value;
                });
                data.updatePageDetails(navBarUpdateList[value]);
              },
            )
        );
      });
  }
}
