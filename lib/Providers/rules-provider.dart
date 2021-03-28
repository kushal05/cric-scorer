import 'package:cric_scorer/Models/match-model.dart';
import 'package:flutter/material.dart';

class RulesProvider extends ChangeNotifier {
  Map<String, Rules> rulesObj = new Map();
  String matchIdForRules;

  setMatchRules(String matchId, Rules rules) {
    matchIdForRules = matchId;
    rulesObj[matchId] = rules;
    notifyListeners();
  }
}