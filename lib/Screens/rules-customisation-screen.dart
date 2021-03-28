import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesCustomisation extends StatefulWidget {
  @override
  _RulesCustomisationState createState() => _RulesCustomisationState();
}

class _RulesCustomisationState extends State<RulesCustomisation> {
  int selectedFormat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Number Of Overs',
                  hintText: 'Eg: 5, 10, 15, 20'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Number Of Wides for a run',
                  hintText: 'Eg: 1 (default), 2 (consecutive)',
                  hintStyle: TextStyle(fontSize: 15)
                ),
              ),
            ),
            DropdownButton(
              hint: Text('Choose a Format'),
              value: selectedFormat,
              items: [
                DropdownMenuItem(
                  value: 1,
                    child: Text('Single Innings')
                ),
                DropdownMenuItem(
                  value: 2,
                    child: Text('Double Innings (Test)')
                )
              ],
              onChanged: (val){
                setState(() {
                  selectedFormat = val;
                });
                print('Selected value: $val');
              },
              onTap: () {
                  print('Tapped');
              },
            ),
            OutlineButton(
                onPressed: () {
                Provider.of<HomeProvider>(context, listen: false).updatePageDetails('scoring');
              },
              child: Text('Start the match'),
            )
          ],
        ),
      ),
    );
  }
}
