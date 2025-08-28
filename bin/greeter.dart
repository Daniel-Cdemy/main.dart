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
  String getFirstName() {
    String firstNameInput = '';
    do {
      print("Bitte geben Sie Ihren Vornamen ein:");
      firstNameInput = stdin.readLineSync() ?? '';
      bool onlyLettersFirstName = RegExp(
        r'^[a-zA-ZäöüÄÖÜß]+$',
      ).hasMatch(firstNameInput);
      if (firstNameInput.isEmpty || !onlyLettersFirstName) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (firstNameInput.trim().isEmpty ||
        !RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(firstNameInput.trim()));
    return firstNameInput;
  }

  String getLastName() {
    String lastNameInput = '';
    do {
      print("Bitte geben Sie Ihren Nachnamen ein:");
      lastNameInput = stdin.readLineSync() ?? '';
      bool onlyLettersLastName = RegExp(
        r'^[a-zA-ZäöüÄÖÜß]+$',
      ).hasMatch(lastNameInput);
      if (lastNameInput.isEmpty || !onlyLettersLastName) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (lastNameInput.trim().isEmpty ||
        !RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(lastNameInput.trim()));
    return lastNameInput;
  }

  int getAge() {
    String ageInput = '';
    int? age;
    do {
      print("Bitte geben Sie Ihr Alter ein:");
      ageInput = stdin.readLineSync() ?? '';
      bool onlyNumbers = RegExp(r'^[0-9]+$').hasMatch(ageInput);
      age = int.tryParse(ageInput);
      if (ageInput.isEmpty ||
          !onlyNumbers ||
          age == null ||
          age < 0 ||
          age > 150) {
        print(
          "Eingabefeld darf nicht leer sein und muss eine Zahl zwischen 0 und 150 sein",
        );
      }
    } while (ageInput.isEmpty || age == null || age < 0 || age > 150);
    return age;
  }

  String getGender() {
    String genderInput = '';
    do {
      print(
        'Bitte geben Sie Ihr Geschlecht an (Männlich = "m", Weiblich = "w", Keine Angabe = "n":',
      );
      bool onlyLettersGender = RegExp(r'^[mwnMWN]+$').hasMatch(genderInput);
      genderInput = stdin.readLineSync() ?? '';
      if (genderInput.isEmpty || !onlyLettersGender) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (genderInput.trim().isEmpty ||
        !RegExp(r'^[mMwWnN]$').hasMatch(genderInput.trim()));
    final gender = genderInput.trim().toLowerCase();
    if (gender == 'm') return 'Herr';
    if (gender == 'w') return 'Frau';
    return '';
  }

  // void output() {
  //   DateTime date = DateTime.now();
  // }

  getFirstName();
  getLastName();
  getAge();
  getGender();
  // output();
}
