import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Feed Screen'),
              SizedBox(height: 20,),
              OutlineButton(
                onPressed: () => Provider.of<HomeProvider>(context, listen: false).updatePageDetails('teamSelection'),
                child: Text('Team Selection'),
              ),
              OutlineButton(
                onPressed: () => Provider.of<HomeProvider>(context, listen: false).updatePageDetails('scoring'),
                child: Text('Scoring'),
              ),
              OutlineButton(
                onPressed: () => Provider.of<HomeProvider>(context, listen: false).updatePageDetails('toss'),
                child: Text('Toss'),
              ),
              OutlineButton(
                onPressed: () => Provider.of<HomeProvider>(context, listen: false).updatePageDetails('rulesCustomisation'),
                child: Text('Rules'),
              ),
            ],
          )
      ),
    );
  }
}
