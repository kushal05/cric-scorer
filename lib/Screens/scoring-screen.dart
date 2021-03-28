import 'package:cric_scorer/Providers/match-details-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scoring extends StatefulWidget {
  @override
  _ScoringState createState() => _ScoringState();
}

class _ScoringState extends State<Scoring> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Consumer<MatchDetailsProvider>(
          builder: (context, data, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Scoring Screen'),
                Text('Match Id: ${data.matchId}'),
                Text('Wides: ${data.rulesObj[data.matchId].numberOfConsecutiveWidesForARun}'),
                Text('Overs: ${data.rulesObj[data.matchId].numberOfOversPerInnings}'),
                Text('No Balls: ${data.rulesObj[data.matchId].numberOfNoBallsAllowed}'),
                Text('Match Format: ${data.rulesObj[data.matchId].matchFormat}'),
              ],
            );
          },
        ),
      ),
    );
  }
}
