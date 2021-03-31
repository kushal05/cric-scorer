import 'dart:async';
import 'package:cric_scorer/Providers/home-provider.dart';
import 'package:cric_scorer/Services/toss-service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Toss extends StatefulWidget {
  @override
  _TossState createState() => _TossState();
}

class _TossState extends State<Toss> {

  List<String> teamNames = ['Team 1', 'Team 2'];
  List<String> coinOutcomes = ['Head', 'Tail'];
  int coinValue = 0;
  String teamCalling;
  double tossIntermediateState = 0.0;
  Timer _timer;
  String tossWinner;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    tossWinner = teamNames[0];
    teamCalling = teamNames[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Who is calling the toss?'),
              Column(
                children: [
                  RadioListTile(
                    title: Text(teamNames[0]),
                    value: teamNames[0],
                    groupValue: teamCalling,
                    onChanged: (String value) {
                      setState(() {
                        teamCalling = value;
                      });
                    },
                    selected: teamCalling == teamNames[0],
                  ),
                  RadioListTile(
                    title: Text(teamNames[1]),
                    value: teamNames[1],
                    groupValue: teamCalling,
                    onChanged: (String value) {
                      setState(() {
                        teamCalling = value;
                      });
                    },
                    selected: teamCalling == teamNames[1],
                  ),
                ],
              ),
              Text('Heads or Tails?'),
              Column(
                children: [
                  RadioListTile<int>(
                    title: Text('Heads'),
                    value: 1,
                    groupValue: coinValue,
                    onChanged: (int value) {
                      setState(() {
                        coinValue = value;
                      });
                    },
                    selected: coinValue == 1,
                  ),
                  RadioListTile<int>(
                    title: Text('Tails'),
                    value: 0,
                    groupValue: coinValue,
                    onChanged: (int value) {
                      setState(() {
                        coinValue = value;
                      });
                    },
                    selected: coinValue == 0,
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {
                tossIntermediateState = 0.0;
                calculateTossWinner();
              }, child: Text('Flip the coin')),
              Container(child: Text('$tossIntermediateState'),),
              Container(child: Text('Winner is $tossWinner'),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  value: tossIntermediateState / 100,
                  minHeight: 10,
                ),
              ),
              OutlineButton(
                onPressed: () {
                  Provider.of<HomeProvider>(context, listen: false)
                      .updatePageStackIndex();
                  Provider.of<HomeProvider>(context, listen: false)
                      .updatePageDetails('scoring');
                },
                child: Text('Go To Scoring'),
              )
            ],
          )
      ),
    );
  }

  void calculateTossWinner() {
    tossIntermediateState = 0.0;
    tossWinner = 'Loading...';
    _timer = new Timer.periodic(Duration(milliseconds: 4), (Timer timer) {
      if(tossIntermediateState > 100) {
        setState(() {
          tossWinner = calculateWinner(teamNames, teamCalling, coinValue);
          timer.cancel();
        });
      } else {
        setState(() {
          tossIntermediateState++;
        });
      }
    });
  }
}
