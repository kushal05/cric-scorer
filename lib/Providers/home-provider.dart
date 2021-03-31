import 'package:cric_scorer/Screens/feed-screen.dart';
import 'package:cric_scorer/Screens/pagesInfo.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentNavBarPageIndex = 0;
  Widget currentNavBarPage = Feed();
  String currentHomePageTitle = 'Cric Scorer';
  List<String> pagesStack = ['teamSelection', 'rulesCustomisation', 'toss', 'scoring'];
  int pageStackIndex = 0;

  updatePageStackIndex() {
    pageStackIndex++;
    notifyListeners();
  }

  updateNavBarPageIndex(int value) {
    currentNavBarPageIndex = value;
    notifyListeners();
  }

  updateNavBarPage(Widget widget) {
    currentNavBarPage = widget;
    notifyListeners();
  }

  updateHomePageTitle(String title) {
    currentHomePageTitle = title;
    notifyListeners();
  }

  updatePageDetails(String type) {
    List<dynamic> pageType;
    if(type == 'startMatchRoot') {
      pageType = pagesMap[pagesStack[pageStackIndex]];
    } else {
      pageType = pagesMap[type];
    }
    currentNavBarPage = pageType[0];
    currentNavBarPageIndex = pageType[1];
    currentHomePageTitle = pageType[2];
    notifyListeners();
  }
}