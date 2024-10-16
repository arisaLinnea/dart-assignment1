import 'package:dart_assignment1/src/models/owner.dart';
import 'package:dart_assignment1/src/repositories/owner_repository.dart';
import 'package:dart_assignment1/src/utils/effects.dart';
import 'package:dart_assignment1/src/utils/menu_choices.dart';

List<String> userOptions = [
  '1. Create a new owner',
  '2. Show me all owners',
  '3. Edit an owner',
  '4. Remove an owner',
  '5. Go back to start screen',
  'q. Quit',
];

void ownerScreen() {
  OwnerRespository respository = OwnerRespository();
  int? userInput;
  clearScreen();

  while (userInput != 5) {
    printGreeting('You can now administrate owners. What do you wanna do?');
    userInput = checkIntOption(
        question: 'Choose an option (1-5): ',
        maxNumber: 5,
        menu: true,
        userOptions: userOptions);
    clearScreen();
    printGreeting('You chose: ${userOptions.elementAt(userInput - 1)}');
    switch (userInput) {
      case 1: // add owner
        String name = checkInputStringValues(question: 'Name on new owner: ');
        String ssn =
            checkInputSsnValues(question: 'Ssn for new owner (YYMMDDNNNN): ');
        Owner newOwner = Owner(name: name, ssn: ssn);
        respository.addToList(item: newOwner);
        printAdd(newOwner.toString());
        printContinue();
        break;
      case 2: // list owner
        List<Owner> ownerList = respository.getList();
        if (ownerList.isEmpty) {
          print('The list of owners are empty');
        } else {
          for (var item in ownerList) {
            print('* $item');
          }
        }
        printContinue();
        break;
      case 3: // edit owner
        List<Owner> ownerList = respository.getList();
        if (ownerList.isEmpty) {
          print('There is no owners to edit.');
        } else {
          int editNo = checkIntOption(
              question: 'What number do you want to edit? ',
              maxNumber: ownerList.length,
              userOptions: ownerList,
              menu: false);
          Owner editOwner = ownerList[editNo - 1];
          bool changeName =
              checkBoolOption(question: 'Do you want to change name? (y?): ');
          if (changeName) {
            String name = checkInputStringValues(
                question: 'What name to you want to change to?: ');
            editOwner.name = name;
          }
          bool changeSsn =
              checkBoolOption(question: 'Do you want to change ssn? (y?): ');
          if (changeSsn) {
            String ssn = checkInputSsnValues(
                question: 'What ssn to you want to change to?: ');
            editOwner.name = ssn;
          }
          respository.update(index: editNo - 1, item: editOwner);
          printAction('Owner has been updated');
        }
        printContinue();
        break;
      case 4: // remove owner
        List<Owner> ownerList = respository.getList();
        if (ownerList.isEmpty) {
          print('There is no owners to remove.');
        } else {
          int removeNo = checkIntOption(
              question: 'What number do you want to remove? ',
              maxNumber: ownerList.length,
              menu: false,
              userOptions: ownerList);
          respository.remove(index: removeNo - 1);
          printAction('List of owners has been updated.');
        }

        printContinue();
        break;
      case 6:
        exitCli();
      default:
        break;
    }
  }
}
