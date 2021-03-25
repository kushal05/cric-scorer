import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesCustomisation extends StatefulWidget {
  @override
  _RulesCustomisationState createState() => _RulesCustomisationState();
}

class _RulesCustomisationState extends State<RulesCustomisation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Rules Customisation'),
            OutlineButton(
                onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).updatePageDetails('scoring');
              },
              child: Text('Score the match'),
            )
          ],
        ),
      ),
    );
  }
}
