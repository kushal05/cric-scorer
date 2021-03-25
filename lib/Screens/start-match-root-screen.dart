import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartMatchRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Start Match Root Screen'),
              OutlineButton(
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false).updatePageDetails('teamSelection');
                },
                child: Text('Team Selection'),
              )
            ],
          )
      ),
    );
  }
}
