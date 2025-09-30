import 'dart:convert';
import 'dart:io';

int getInt() {
  String intInputString = '';
  int? intInput;
  do {
    print("Bitte geben Sie eine Zahl zwischen 3 und 10.000 ein:");
    intInputString = stdin.readLineSync(encoding: utf8) ?? '';
    bool onlyNumbers = RegExp(r'^[0-9]+$').hasMatch(intInputString);
    intInput = int.tryParse(intInputString);
    if (intInputString.isEmpty ||
        !onlyNumbers ||
        intInput == null ||
        intInput < 3 ||
        intInput > 10000) {
      print(
        "Das Eingabefeld darf nicht leer sein und muss eine Zahl zwischen 3 und 10.000 sein",
      );
    }
  } while (intInputString.isEmpty ||
      intInput == null ||
      intInput < 3 ||
      intInput > 10000);
  return intInput;
}
