import 'dart:io';

import 'effects.dart';

void printContinue() {
  stdout.write('Press enter to see options again. ');
  stdin.readLineSync();
  clearScreen();
}

String checkInputStringValues({required String question}) {
  String? inputValue;
  while (inputValue == "" || inputValue == null) {
    //   if (inputValue == "") {
    stdout.write(question);
    inputValue = stdin.readLineSync();
    //   }
    if (inputValue == "") {
      printError('Invalid input. Please fill in missing value.');
    }
  }
  return inputValue;
}

bool checkBoolOption({required String question}) {
  stdout.write(question);
  String? input = stdin.readLineSync();
  if (input == 'y' || input == "Y") {
    return true;
  }
  return false;
}

int checkIntOption({required int maxNumber, required String question}) {
  int? numberChoosen;
  while (numberChoosen == null) {
    stdout.write(question);
    String? input = stdin.readLineSync();
    if (input == null ||
        int.tryParse(input) == null ||
        int.parse(input) < 1 ||
        int.parse(input) > maxNumber) {
      print(
          'You entered "$input", but need to choose a number between 1-$maxNumber');
      continue;
    }
    numberChoosen = int.parse(input);
  }
  return numberChoosen;
}
