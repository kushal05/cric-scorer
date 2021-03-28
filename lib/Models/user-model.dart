class MatchRecords {
  List<User> bowled;
  String bowledBy;
  List<User> caught;
  String caughtBy;
  List<User> stumped;
  String stumpedBy;

  MatchRecords() {
    this.bowled = [];
    this.bowledBy = '';
    this.caught = [];
    this.caughtBy = '';
    this.stumped = [];
    this.stumpedBy = '';
  }
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
  int ballsBowled;
  double overs;
  int maidens;
  int runsGiven;
  double economy;

  MatchRecords extraMatchRecords;

  Record() {
    this.matches = 0;
    this.matchesWon = 0;

    this.ballsFaced = 0;
    this.runsMade = 0;
    this.fours = 0;
    this.sixes = 0;

    this.catches = 0;
    this.stumps = 0;
    this.runOuts = 0;

    this.wickets = 0;
    this.ballsBowled = 0;
    this.overs = 0;
    this.maidens = 0;
    this.runsGiven = 0;
    this.economy = 0;

    this.extraMatchRecords = new MatchRecords();
  }
}

class User {
  String userId;
  String email;
  String phone;
  String name;
  Record record;
  List<Record> matchRecords;
  bool inAMatch;

  User() {
    this.userId = '';
    this.email = '';
    this.phone = '';
    this.name = '';
    this.record = new Record();
    this.matchRecords = [];
    this.inAMatch = false;
  }
}