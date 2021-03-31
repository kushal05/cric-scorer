import 'dart:math';

String calculateWinner(List<String> teams, String caller, int choice) {
  double randomDouble = double.parse(Random().nextDouble().toStringAsFixed(15));
  int intermediateTemp = 0;
  String otherThanCaller;
  for(int i=1; i<=15; i++) {
    intermediateTemp += (randomDouble * (10 ^ i)).toInt();
    intermediateTemp += i;
  }
  intermediateTemp = intermediateTemp % 2;
  (teams[0] == caller) ? otherThanCaller = teams[1] : otherThanCaller = teams[0];

  return (choice == intermediateTemp) ? caller : otherThanCaller;
}