import 'user-model.dart';

enum MatchFormat {
  SINGLE_INNINGS, DOUBLE_INNINGS
}

class Rules {
  int numberOfConsecutiveWidesForARun;
  int numberOfNoBallsAllowed;
  int numberOfOversPerInnings;
  MatchFormat matchFormat; // Single Innings, Test

  Rules() {
    this.numberOfConsecutiveWidesForARun = 0;
    this.numberOfOversPerInnings = 0;
    this.numberOfNoBallsAllowed = 0;
    this.matchFormat = MatchFormat.SINGLE_INNINGS;
  }
}


class Match {
  String matchId;
  String matchDate;
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
  User scorer;

  List<User> currentBatsmen;
  User currentBowler;

  List<int> teamScores; // First innings, Second Innings
  List<int> teamWickets;
  List<int> opponentScores;
  List<int> opponentWickets;

  Rules matchRules;

  Match() {
    this.matchId = '';
    this.matchId = '';
    this.matchDate = '';
    this.matchPlace = '';
    this.matchStatus = ''; // In Progress, Done, Abandoned
    this.matchWinner = '';

    this.teamName = '';
    this.teamSize = 0;
    this.opponentName = '';
    this.opponentSize = 0;

    this.teamMembers = [];
    this.opponentMembers = [];
    this.middleMan = new User();
    this.scorer = new User();

    this.currentBatsmen = [];
    this.currentBowler = new User();

    this.teamScores = []; // First innings, Second Innings
    this.teamWickets = [];
    this.opponentScores = [];
    this.opponentWickets = [];

    this.matchRules = new Rules();
  }
}