enum ScoringOptions {
  WIDE, NO_BALL, DEAD_BALL,
  ONE, TWO, THREE, FOUR, FIVE, SIX,
  WICKET
}

Map<ScoringOptions, int> scoreValues = {
  ScoringOptions.WIDE: 0,
  ScoringOptions.NO_BALL: 0,
  ScoringOptions.DEAD_BALL: 0,
  ScoringOptions.ONE: 1,
  ScoringOptions.TWO: 2,
  ScoringOptions.THREE: 3,
  ScoringOptions.FOUR: 4,
  ScoringOptions.FIVE: 5,
  ScoringOptions.SIX: 6,
  ScoringOptions.WICKET: 0
};

class Over {
  int overNumber;
  List<ScoringOptions> overTimeline; //[ScoringOptions.ONE, ScoringOptions.WICKET]
  List<int> overTimelineValues; // [1, 0]
}

class TimeLine {
  List<Over> timeLine;
}