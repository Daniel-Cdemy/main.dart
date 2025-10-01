import 'dart:convert';
import 'dart:io';

int getInt() {
  String rawInput = '';
  int? intInput;
  do {
    print(
      "Bitte geben Sie eine Zahl ein, um zu prüfen wie viele Primzahlen darin enthalten sind:",
    );
    rawInput = stdin.readLineSync(encoding: utf8) ?? '';
    bool onlyNumbers = RegExp(r'^[0-9]+$').hasMatch(rawInput);
    intInput = int.tryParse(rawInput);
    if (rawInput.isEmpty || !onlyNumbers || intInput == null) {
      print("Das Eingabefeld darf nicht leer sein und muss eine Zahl sein");
    }
  } while (rawInput.isEmpty || intInput == null);
  return intInput;
}
