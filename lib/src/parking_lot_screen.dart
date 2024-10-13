import 'dart:io';

import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/repositories/parking_lot_repository.dart';
import 'package:dart_assignment1/src/utils/effects.dart';
import 'package:dart_assignment1/src/utils/menu_choices.dart';

List<String> userOptions = [
  '1. Create a new parking lot',
  '2. Show me all parking lots',
  '3. Edit a parking lot',
  '4. Remove a parking lot',
  '5. Go back to start screen',
  '6. Quit',
];

void parkingLotScreen() {
  ParkingLotRespository respository = ParkingLotRespository();
  int? userInput;
  clearScreen();

  while (userInput != 5) {
    printGreeting(
        'You can now administrate parking lots. What do you wanna do?');
    // userOptions.forEach(stdout.writeln);
    userInput = checkIntOption(
        question: 'Choose an option (1-5): ',
        maxNumber: 6,
        menu: true,
        userOptions: userOptions);
    clearScreen();
    printGreeting('You chose: ${userOptions.elementAt(userInput - 1)}');
    switch (userInput) {
      case 1: // add parking lot
        String streetName = checkInputStringValues(
            question: 'Streetname and number for the parking lot: ');
        String zipCode =
            checkInputStringValues(question: 'Zipcode for the parking lot: ');
        String city =
            checkInputStringValues(question: 'City for the parking lot: ');
        Address address = Address(streetName, zipCode, city);
        double hourlyPrice =
            checkDoubleOption(question: 'Hourly price for this parking lot: ');

        ParkingLot newLot =
            ParkingLot(address: address, hourlyPrice: hourlyPrice);
        respository.addToList(item: newLot);
        printAdd(newLot.toString());
        printContinue();
        break;
      case 2: // list parking lots
        List<ParkingLot> lotList = respository.getList();
        if (lotList.isEmpty) {
          print('The list of parking lots are empty');
        } else {
          lotList.forEach(print);
        }
        printContinue();
        break;
      case 3: // edit parking lot
        List<ParkingLot> lotList = respository.getList();
        if (lotList.isEmpty) {
          print('There is no parking lots to edit.');
        } else {
          // for (final (index, item) in lotList.indexed) {
          //   print("${index + 1}. $item");
          // }
          int editNo = checkIntOption(
              question: 'What number do you want to edit? ',
              maxNumber: lotList.length,
              userOptions: lotList,
              menu: false);
          ParkingLot editLot = lotList[editNo - 1];

          bool changeAddress = checkBoolOption(
              question: 'Do you want to change address? (y?): ');
          if (changeAddress) {
            String streetName = checkInputStringValues(
                question: 'Streetname and number for the parking lot: ');
            String zipCode = checkInputStringValues(
                question: 'Zipcode for the parking lot: ');
            String city =
                checkInputStringValues(question: 'City for the parking lot: ');
            Address address = Address(streetName, zipCode, city);
            editLot.address = address;
          }
          bool changePrice = checkBoolOption(
              question: 'Do you want to change hourly price (y?): ');
          if (changePrice) {
            double hourlyPrice = checkDoubleOption(
                question: 'Hourly price for this parking lot: ');
            editLot.hourlyPrice = hourlyPrice;
          }

          respository.update(index: editNo - 1, item: editLot);
          printAction('Parking lot has been updated');
        }
        printContinue();
        break;
      case 4: // remove parking lot
        List<ParkingLot> lotList = respository.getList();
        if (lotList.isEmpty) {
          print('There is no parking lots to remove.');
        } else {
          // for (final (index, item) in lotList.indexed) {
          //   print("${index + 1}. $item");
          // }
          int removeNo = checkIntOption(
              question: 'What number do you want to remove? ',
              maxNumber: lotList.length,
              userOptions: lotList,
              menu: false);
          respository.remove(index: removeNo - 1);
          printAction('List of parking lots has been updated.');
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
