import 'package:main_dart/primes_functions.dart';
import 'dart:math';

void main() {
  final intInput = getInt();
  if (intInput < 2) {
    print('Keine Primzahl gefunden');
    return;
  }
  if (intInput == 2) {
    print('Primzahlen: 2 \nGesamt: (1)');
    return;
  }
  final primes = <int>[2];
  for (var numberToTest = 3; numberToTest <= intInput; numberToTest += 2) {
    var hasDivisor = false;
    for (
      var primeIndex = 0;
      primeIndex < primes.length && primes[primeIndex] <= sqrt(numberToTest);
      primeIndex++
    ) {
      final divisor = primes[primeIndex];
      if (numberToTest % divisor == 0) {
        hasDivisor = true;
        break;
      }
    }
    if (!hasDivisor) {
      primes.add(numberToTest);
    }
  }
  print('Primzahlen: ${primes.join(', ')} \nGesamt: (${primes.length})');
}
