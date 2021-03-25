import 'user-model.dart';

class Rules {
  int numberOfConsecutiveWidesForARun;
  int numberOfNoBallsAllowed;
  int numberOfOversPerInnings;
  int matchFormat; // Single Innings, Test
}


class Match {
  String matchId;
  DateTime matchDate;
  String matchPlace;
  String matchStatus; // In Progress, Done, Abandoned
  String matchWinner;

  String teamName;
  int teamSize;
  String opponentName;
  int opponentSize;

  List<User> teamMembers;
  List<User> opponentMembers;
  User middleMan;
  String scorerEmail;

  List<int> teamScores; // First innings, Second Innings
  List<int> teamWickets;
  List<int> opponentScores;
  List<int> opponentWickets;

  Rules matchRules;
}