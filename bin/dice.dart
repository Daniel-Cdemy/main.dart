import 'dart:math';
import 'package:main_dart/dice_functions.dart';

void main() {
  final dices = getInt();
  final rng = Random();
  final throws = <int>[];
  for (var i = 0; i < dices; i++) {
    final diceRolls = rng.nextInt(6) + 1;
    throws.add(diceRolls);
    if (i >= 2) {
      if (throws[i] == 6) {
        if (throws[i - 1] == 6) {
          break;
        }
      }
    }
  }
  print('Würfe: $throws');
}
