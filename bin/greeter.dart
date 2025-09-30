import 'package:main_dart/greeter_functions.dart';

void main() {
  final firstName = getFirstName();
  final lastName = getLastName();
  final age = getAge();
  final gender = getGender();
  final dayTime = daytimeLabel(DateTime.now());

  String text;
  if (age < 40) {
    text = 'Hallo, $firstName!';
  } else {
    final displayName = gender.isEmpty
        ? '$firstName $lastName'
        : '$gender $lastName';
    text = 'Guten $dayTime,\n$displayName!';
  }

  print(text);
}
