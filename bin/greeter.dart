/* Abfrage von nutzerdaten:
Vorname: Eingabefeld darf nicht leer sein & darf nur Buchstaben enthalten
Nachname: Eingabefeld darf nicht leer sein & darf nur Buchstaben enthalten
Alter: Eingabefeld darf nicht leer sein & darf nur Zahlen enthalten
& muss zwischen 0-150 liegen
Geschlecht: wahl männlich [m] / weiblich [w] / keine angabe [n]

Wenn nicht erfüllt > wiederholen mit info
wenn erfüllt > ausgabe

Ausgabe: 
Wenn Person < 40 = "Hallo, $vorname"
Wenn Person > 40 = "Guten `Tageszeit`, (10-18 = Tag, 18-2 = Abend 2-10 = Morgen
$anrede $nachname"
Wennp Person > 40 && keine angabe[n] = "Guten `Tageszeit`,
$vorname $nachname*/

import 'dart:io';

void main() {
  String? firstNameInput;
  String? lastNameInput;
  String? ageInput;
  String? genderInput;

  void getFirstName() {
    bool onlyLettersFirstName = RegExp(
      r'^[a-zA-ZäöüÄÖÜß]+$',
    ).hasMatch(firstNameInput ?? "");
    do {
      print("Bitte geben Sie Ihren Vornamen ein:");
      firstNameInput = stdin.readLineSync();
      if (firstNameInput == null || !onlyLettersFirstName) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (firstNameInput == null || !onlyLettersFirstName);
  }

  void getLastName() {
    bool onlyLettersLastName = RegExp(
      r'^[a-zA-ZäöüÄÖÜß]+$',
    ).hasMatch(lastNameInput ?? "");
    do {
      print("Bitte geben Sie Ihren Nachnamen ein:");
      lastNameInput = stdin.readLineSync();
      if (lastNameInput == null || !onlyLettersLastName) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (lastNameInput == null || !onlyLettersLastName);
  }

  void getAge() {
    int? age = int.tryParse(ageInput ?? "");
    bool onlyNumbers = RegExp(r'^[0-9]+$').hasMatch(ageInput ?? "");
    do {
      print("Bitte geben Sie Ihr Alter ein:");
      ageInput = stdin.readLineSync();
      if (ageInput == null || !onlyNumbers) {
        print(
          "Eingabefeld darf nicht leer sein und muss eine Zahl zwischen 0 und 150 sein",
        );
      }
    } while (ageInput == null || !onlyNumbers);
  }

  void getGender() {
    bool onlyLettersGender = RegExp(r'^[mwnMWN]+$').hasMatch(genderInput ?? "");
    do {
      print(
        'Bitte geben Sie Ihr Geschlecht an (Männlich = "m", Weiblich = "w", Keine Angabe = "n":',
      );
      genderInput = stdin.readLineSync();
      if (genderInput == null || !onlyLettersGender) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (genderInput == null || !onlyLettersGender);
  }

  void output() {
    DateTime date = DateTime.now();
  }

  getFirstName();
  getLastName();
  getAge();
  getGender();
  output();
}
