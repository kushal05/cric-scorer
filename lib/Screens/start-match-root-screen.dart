import 'dart:async';

import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:cric_scorer/Providers/start-match-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartMatchRoot extends StatefulWidget {
  @override
  _StartMatchRootState createState() => _StartMatchRootState();
}

class _StartMatchRootState extends State<StartMatchRoot> {

  bool showLoader = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => updatePageBasedOnUserState());
  }

  void updatePageDelayed(){
    Timer(Duration(seconds: 2), () => updatePageBasedOnUserState());
  }

  void updatePageBasedOnUserState() {
    if(Provider.of<StartMatchProvider>(context, listen: false).canUserStartMatch(context)) {
      Provider.of<HomeProvider>(context, listen: false).updatePageStackIndex();
      Provider.of<HomeProvider>(context, listen: false).updatePageDetails('teamSelection');
    } else {
      Provider.of<HomeProvider>(context, listen: false).updatePageDetails('scoreView');
    }
    showLoader = false;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StartMatchProvider>(
      builder: (context, data, _) {
        return Container(
          child: Center(
              child: (showLoader) ? CircularProgressIndicator() : null
          ),
        );
      },
    );
  }
}
