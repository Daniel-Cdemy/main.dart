import 'package:main_dart/primes_functions.dart';
import 'dart:math';

void main() {
  final inputLimit = getInt();
  if (inputLimit < 2) {
    print('Keine Primzahl gefunden');
  }
  if (inputLimit == 2) {
    print('Primzahlen: 2');
  }
  final primes = <int>[2];
  for (var numberToTest = 3; numberToTest <= inputLimit; numberToTest += 2) {
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
  print('Primzahlen (${primes.length}): ${primes.join(', ')}');
}
