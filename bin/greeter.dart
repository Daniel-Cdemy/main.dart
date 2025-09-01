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
    bool ok;
    do {
      print("Bitte geben Sie Ihren Vornamen ein:");
      firstNameInput = stdin.readLineSync() ?? '';
      ok = RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(firstNameInput);
      if (firstNameInput.isEmpty || !ok) {
        print("Eingabefeld darf nicht leer sein und keine Zahlen enthalten");
      }
    } while (firstNameInput.trim().isEmpty ||
        !RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(firstNameInput.trim()));
    return firstNameInput;
  }

  String getLastName() {
    String lastNameInput = '';
    bool ok;
    do {
      print("Bitte geben Sie Ihren Nachnamen ein:");
      lastNameInput = stdin.readLineSync() ?? '';
      ok = RegExp(r'^[a-zA-ZäöüÄÖÜß]+$').hasMatch(lastNameInput);
      if (lastNameInput.isEmpty || !ok) {
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
    bool ok;
    do {
      print(
        'Bitte geben Sie Ihr Geschlecht an: Männlich [m] / Weiblich [w] / Keine Angabe [n]',
      );
      genderInput = stdin.readLineSync() ?? '';
      ok = RegExp(r'^[mMwWnN]$').hasMatch(genderInput.trim());

      if (genderInput.trim().isEmpty || !ok) {
        print('Eingabe muss m / w / n sein (kein Leerzeichen, ein Zeichen).');
      }
    } while (genderInput.trim().isEmpty || !ok);
    final gender = genderInput.trim().toLowerCase();
    if (gender == 'm') return 'Herr';
    if (gender == 'w') return 'Frau';
    return '';
  }

  String tageszeitLabel(DateTime now) {
    final hour = now.hour;
    if (hour >= 10 && hour < 18) return 'Tag';
    if (hour >= 18 || hour < 2) return 'Abend';
    return 'Morgen';
  }

  void output() {
    final vorname = getFirstName();
    final nachname = getLastName();
    final alter = getAge();
    final anrede = getGender();
    final zeit = tageszeitLabel(DateTime.now());

    String text;
    if (alter < 40) {
      text = 'Hallo, $vorname';
    } else {
      final nameTeil = anrede.isEmpty
          ? '$vorname $nachname'
          : '$anrede $nachname';
      text = 'Guten $zeit,\n$nameTeil';
    }

    print(text);
  }
}
