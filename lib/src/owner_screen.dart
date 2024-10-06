import 'dart:io';

import 'package:dart_assignment1/src/models/Owner.dart';
import 'package:dart_assignment1/src/repositories/owner_repository.dart';
import 'package:dart_assignment1/src/utils.dart';

int? userInput;
Set<String> userOptions = {
  '1. Create a new owner',
  '2. Show me all owners',
  '3. Edit an owner',
  '4. Remove an owner',
  '5. Go back to start screen',
};

void ownerScreen() {
  OwnerRespository respository = OwnerRespository();

  clearScreen();

  while (userInput != 5) {
    stdout.writeln('You can now administrate owners. What do you wanna do?');
    userOptions.forEach(stdout.writeln);
    stdout.write('Choose an option (1-5): ');
    String? input = stdin.readLineSync();
    if (input == null ||
        int.tryParse(input) == null ||
        int.parse(input) < 1 ||
        int.parse(input) > 5) {
      clearScreen();
      print('You entered "$input", but need to choose a number between 1-5');
      continue;
    }
    userInput = int.parse(input);
    print('You choose: ${userOptions.elementAt(userInput! - 1)}');
    switch (userInput) {
      case 1:
        stdout.write('Name on new owner: ');
        String? name = stdin.readLineSync();
        stdout.write('Ssn for new owner: ');
        String? ssn = stdin.readLineSync();
        Owner newOwner = Owner(name: name!, ssn: ssn!);
        print(newOwner.toString());
        respository.addToList(newOwner);
        stdout.write('Owner created. Press enter to see options again. ');
        stdin.readLineSync();
        clearScreen();
        break;
      case 2:
        Map<String, Owner> ownerList = respository.getList();
        if (ownerList.isEmpty) {
          print('The list of owners are empty');
        } else {
          ownerList.forEach((key, value) {
            print(value.toString());
          });
        }
        stdout.write('Press enter to see options again. ');
        stdin.readLineSync();
        clearScreen();
        break;
      default:
        break;
    }
  }
}
