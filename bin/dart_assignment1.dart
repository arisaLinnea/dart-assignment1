import 'package:dart_assignment1/dart_assignment1.dart' as dart_assignment;
import 'dart:io';

import 'package:dart_assignment1/src/owner_screen.dart';
import 'package:dart_assignment1/src/utils.dart';

Set<String> userOptions = {
  '1. Persons',
  '2. Vehicles',
  '3. Parkinglots',
  '4. Your parkings',
  '5. Quit'
};

enum State { Default, Owner, Vehicle, ParkingLot, Parking }

void main() {
  // final String path = Directory.current.path;
  var myFile = File('file.txt');
//   final OwnerRepository ownerRepository = OwnerRepository.instance;

//   await ownerRepository.initialize(filePath: path);

  clearScreen();
  printGreeting('Welcome to FindMeASpot!');
  int? userInput;
  var appState = State.Default;

  while (userInput != 5) {
    stdout.writeln('What do you want to do? ');
    userOptions.forEach(stdout.writeln);
    stdout.write('Choose an option (1-5): ');
    String? input = stdin.readLineSync();
    if (input == null ||
        int.tryParse(input) == null ||
        int.parse(input) < 1 ||
        int.parse(input) > 5) {
      clearScreen();
      printError(
          'You entered "$input", but need to choose a number between 1-5');
      continue;
    }
    userInput = int.parse(input);
    switch (userInput) {
      case 1:
        ownerScreen();
        break;
      default:
        break;
    }
    // print('You choose: $userInput');
  }

  printGreeting('Thank you for choosing FindMeASpot!');
}
