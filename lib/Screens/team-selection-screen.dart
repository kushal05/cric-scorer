import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamSelection extends StatefulWidget {
  @override
  _TeamSelectionState createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Team Selection Screen'),
            OutlineButton(
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false).updatePageDetails('rulesCustomisation');
                },
              child: Text('Customize Rules'),
            ),
          ],
        ),
      ),
    );
  }
}
