import 'package:cric_scorer/Models/match-model.dart';
import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:cric_scorer/Providers/match-details-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RulesCustomisation extends StatefulWidget {
  @override
  _RulesCustomisationState createState() => _RulesCustomisationState();
}

class _RulesCustomisationState extends State<RulesCustomisation> {
  int selectedFormat;
  Match matchObject;

  TextEditingController oversController = new TextEditingController();
  TextEditingController widesController = new TextEditingController();
  TextEditingController noBallsController = new TextEditingController();
  MatchFormat formatController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: oversController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number Of Overs Per Innings',
                  hintText: 'Eg: 5, 10, 15, 20',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: widesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Number Of Consecutive Wides For A Run',
                  hintText: 'Eg: 1 (default), 2 (consecutive)',
                  hintStyle: TextStyle(fontSize: 15)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: noBallsController,
                keyboardType: TextInputType.number,
                onEditingComplete: () {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  labelText: 'Number Of No-Balls Allowed In An Over',
                  hintText: 'Eg: 1 (default), 2 (extra)',
                  hintStyle: TextStyle(fontSize: 15)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
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
                    (val == 1) ? formatController = MatchFormat.SINGLE_INNINGS : formatController = MatchFormat.DOUBLE_INNINGS;
                  });
                  print('Selected value: $val');
                },
                onTap: (){
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            OutlineButton(
                onPressed: () {
                  matchObject = updateMatchObject();
                  Provider.of<MatchDetailsProvider>(context, listen: false).setMatchObj(matchObject);
                  Provider.of<MatchDetailsProvider>(context, listen: false).setMatchRules(matchObject.matchId, matchObject.matchRules);
                  Provider.of<HomeProvider>(context, listen: false).updatePageStackIndex();
                  Provider.of<HomeProvider>(context, listen: false).updatePageDetails('toss');
              },
              child: Text('Go To Toss'),
            )
          ],
        ),
      ),
    );
  }

  Match updateMatchObject() {
    Match updateObj = new Match();
    updateObj.matchId = "12340";
    updateObj.matchRules.matchFormat = formatController;
    updateObj.matchRules.numberOfConsecutiveWidesForARun = int.tryParse(widesController.text);
    updateObj.matchRules.numberOfNoBallsAllowed = int.tryParse(noBallsController.text);
    updateObj.matchRules.numberOfOversPerInnings = int.tryParse(oversController.text);
    return updateObj;
  }
}
