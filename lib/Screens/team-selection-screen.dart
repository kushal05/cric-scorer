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
              showDialog(
                context: context,
                builder: (BuildContext context) => openAddPlayersDialog(context)
              );
            },
              child: Text('Add Players'),
            ),
            OutlineButton(
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false).updatePageDetails('rulesCustomisation');
                },
              child: Text('Add Rules'),
            ),
          ],
        ),
      ),
    );
  }

  Widget openAddPlayersDialog(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return AlertDialog(
      scrollable: true,
      title: Text('Testing add players'),
      content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextField(),
              Container(
                height: height/2,
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Dummy User'),
                      trailing: OutlineButton(
                          onPressed: (){
                            print('Added user to the team $index');
                          },
                        child: Text('Add to team'),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      actions: <Widget>[
        OutlineButton(
            onPressed: () {
              Navigator.pop(context);
            },
          child: Text('Done'),
        )
      ],
    );
  }
}
