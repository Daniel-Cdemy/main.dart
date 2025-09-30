import 'dart:io';
import 'dart:convert';

void main() {
  final firstName = getFirstName();
  final lastName = getLastName();
  final age = getAge();
  final gender = getGender();
  final dayTime = daytimeLabel(DateTime.now());

  String text;
  if (age < 40) {
    text = 'Hallo, $firstName';
  } else {
    final displayName = gender.isEmpty
        ? '$firstName $lastName'
        : '$gender $lastName';
    text = 'Guten $dayTime,\n$displayName';
  }

  print(text);
}

String getFirstName() {
  String firstNameInput = '';
  bool ok;
  do {
    print("Bitte geben Sie Ihren Vornamen ein:");
    firstNameInput = stdin.readLineSync(encoding: utf8) ?? '';
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
    lastNameInput = stdin.readLineSync(encoding: utf8) ?? '';
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
      print('Eingabe muss m / w / n sein (kein Leerzeichen, nur ein Zeichen).');
    }
  } while (genderInput.trim().isEmpty || !ok);
  final gender = genderInput.trim().toLowerCase();
  if (gender == 'm') return 'Herr';
  if (gender == 'w') return 'Frau';
  return '';
}

String daytimeLabel(DateTime now) {
  final hour = now.hour;
  if (hour >= 10 && hour < 18) return 'Tag';
  if (hour >= 18 || hour < 2) return 'Abend';
  return 'Morgen';
}
