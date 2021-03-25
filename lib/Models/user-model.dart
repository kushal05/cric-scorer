class MatchRecords {
  List<User> bowled;
  User bowledBy;
  List<User> caught;
  User caughtBy;
  List<User> stumped;
  User stumpedBy;
}

class Record {
  int matches;
  int matchesWon;

  int ballsFaced;
  int runsMade;
  int fours;
  int sixes;

  int catches;
  int stumps;
  int runOuts;

  int wickets;
  double overs;
  int maidens;
  int runsGiven;
  double economy;

  MatchRecords extraMatchRecords;
}

class User {
  String id;
  String email;
  String phone;
  String name;
  Record record;
  List<Record> matchRecords;
  bool inAMatch;
}