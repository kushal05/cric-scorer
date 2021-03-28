import 'package:cric_scorer/Screens/feed-screen.dart';
import 'package:cric_scorer/Screens/profile-screen.dart';
import 'package:cric_scorer/Screens/records-screen.dart';
import 'package:cric_scorer/Screens/rules-customisation-screen.dart';
import 'package:cric_scorer/Screens/score-view-screen.dart';
import 'package:cric_scorer/Screens/scoring-screen.dart';
import 'package:cric_scorer/Screens/start-match-root-screen.dart';
import 'package:cric_scorer/Screens/team-selection-screen.dart';
import 'package:flutter/material.dart';


List<Widget> navBarPages = [
  Feed(),
  StartMatchRoot(),
  Profile(),
  TeamSelection(),
  RulesCustomisation(),
  Scoring(),
  Records(),
  ScoreView()
];

Map<String, int> pagesMapIndex = {
  'Feed': 0,
  'StartMatchRoot': 1,
  'Profile': 2,
  'TeamSelection': 3,
  'RulesCustomisation': 4,
  'Scoring': 5,
  'Records': 6,
};
Map<String, Widget> pagesMapWidget = {
  'Feed': Feed(),
  'StartMatchRoot': StartMatchRoot(),
  'Profile': Profile(),
  'TeamSelection': TeamSelection(),
  'RulesCustomisation': RulesCustomisation(),
  'Scoring': Scoring(),
  'Records': Records(),
};

Map<String, List<dynamic>> pagesMap = {
  'feed': [Feed(), 0, 'Cric Scorer'],
  'startMatchRoot': [StartMatchRoot(), 1, ''],
  'profile': [Profile(), 2, 'Profile'],
  'teamSelection': [TeamSelection(), 3, 'Team Selection'],
  'rulesCustomisation': [RulesCustomisation(), 4, 'Customize Rules'],
  'scoring': [Scoring(), 5, 'Scoring'],
  'records': [Records(), 6, 'Your Records'],
  'scoreView': [ScoreView(), 7, 'Score']
};

List<BottomNavigationBarItem> navBarItems = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
      backgroundColor: Colors.green
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.play_circle_outline),
      label: 'New match',
      backgroundColor: Colors.green
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.quick_contacts_mail_rounded),
      label: 'Profile',
      backgroundColor: Colors.green
  ),
];