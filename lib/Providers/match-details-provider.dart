import 'package:cric_scorer/Models/match-model.dart';
import 'package:flutter/material.dart';

class MatchDetailsProvider extends ChangeNotifier {
  // this takes care of all the details regarding a match
  // scores of teams, players
  Map<String, Rules> rulesObj = new Map();
  Map<String, Match> matchObj = new Map();
  String matchId;

  setMatchObj(Match match) {
    matchId = match.matchId;
    matchObj[match.matchId] = match;
    print('Inside after setMatchObj: ${match.matchId}, $matchObj');
  }

  setMatchRules(String matchId, Rules rules) {
    matchId = matchId;
    rulesObj[matchId] = rules;
    notifyListeners();
  }
}