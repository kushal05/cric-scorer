import 'package:cric_scorer/Providers/start-match-provider.dart';
import 'package:cric_scorer/Providers/user-provider.dart';
import 'package:cric_scorer/Screens/home-screen.dart';
import 'package:cric_scorer/Screens/rules-customisation-screen.dart';
import 'package:cric_scorer/Screens/splash-screen.dart';
import 'package:cric_scorer/Screens/team-selection-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/home-provider.dart';
import 'Providers/login-provider.dart';
import 'Providers/signup-provider.dart';
import 'Screens/login-screen.dart';
import 'Screens/signup-screen.dart';

/*
Map<String, Widget Function(BuildContext context)> routes = {
  '/login': (context) =>
      MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(
            create: (_) => LoginProvider(),),
          ChangeNotifierProvider<SignUpProvider>(
              create: (_) => SignUpProvider()),
        ],
        child: Login(appBarTitle: "Login",),),
  '/signup': (context) =>
      ChangeNotifierProvider(
        create: (_) => SignUpProvider(), child: SignUp(appBarTitle: "Join",),),
  '/home': (context) => ChangeNotifierProvider(create: (_) => PageStructureProvider(), child: HomePage()),
  '/page-structure': (context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => PageStructureProvider()
      ),
      ChangeNotifierProvider(
          create: (_) => HomePageProvider()
      ),
      ChangeNotifierProvider(
        create: (_) => AddNotesProvider(),
      )
    ],
    child: PageStructure(),
  ),
  '/join-community': (context) => ChangeNotifierProvider(create: (_) => JoinCommunityProvider(), child: JoinCommunity(),),

};
*/


Map<String, Widget Function(BuildContext context)> routes = {
  '/login': (context) => ChangeNotifierProvider(
    create: (_) => LoginProvider(),
    child: Login(),
  ),
  '/signup': (context) => ChangeNotifierProvider(
    create: (_) => SignUpProvider(),
    child: SignUp(),
  ),
  '/splash': (context) => Splash(),
  '/home': (context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => HomeProvider(),
      ),
      ChangeNotifierProvider(
          create: (_) => StartMatchProvider()
      ),
      ChangeNotifierProvider(
          create: (_) => UserProvider()
      )
    ],
    child: Home()
  ),
  '/rules': (context) => RulesCustomisation(),
  '/team-selection': (context) => TeamSelection()
};