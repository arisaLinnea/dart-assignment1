import 'dart:io';

import 'package:dart_assignment1/src/models/owner.dart';
import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:dart_assignment1/src/repositories/owner_repository.dart';
import 'package:dart_assignment1/src/repositories/vehicle_repository.dart';
import 'package:dart_assignment1/src/utils/effects.dart';
import 'package:dart_assignment1/src/utils/menu_choices.dart';

List<String> userOptions = [
  '1. Create a new vehicle',
  '2. Show me all vehicles',
  '3. Edit a vehicle',
  '4. Remove a vehicle',
  '5. Go back to start screen',
  'q. Quit',
];

void vehicleScreen() {
  VehicleRespository respository = VehicleRespository();
  OwnerRespository ownerRespository = OwnerRespository();
  int? userInput;
  clearScreen();

  List<Owner> ownerList = ownerRespository.getList();

  while (userInput != 5) {
    printGreeting('You can now administrate vehicles. What do you wanna do?');
    userInput = checkIntOption(
        question: 'Choose an option (1-5): ',
        maxNumber: 5,
        userOptions: userOptions,
        menu: true);
    clearScreen();
    printGreeting('You chose: ${userOptions.elementAt(userInput - 1)}');
    switch (userInput) {
      case 1: // add vehicle
        if (ownerList.isEmpty) {
          print(
              'To add a vehicle you need an owner. Press any key to go back to main menu and choose to add an owner.');
          stdin.readLineSync();
          clearScreen();
          userInput = 5;
          break;
        }
        String registrationNo = checkInputStringValues(
            question: 'Registration number for new vehicle: ');
        printListInfo('This is the types you can add:');
        int vehicleTypeIndex = checkIntOption(
            question: 'Type for new vehicle: ',
            maxNumber: VehicleType.values.length,
            userOptions: VehicleType.values,
            menu: false);
        VehicleType type = VehicleType.values[vehicleTypeIndex - 1];
        printListInfo('This is the owners you can add:');
        int ownerIndex = checkIntOption(
            question:
                'Enter number of the owner you would like to add to this vehicle: ',
            maxNumber: ownerList.length,
            userOptions: ownerList,
            menu: false);
        Owner vehicleOwner = ownerList[ownerIndex - 1];

        Vehicle newVehicle = Vehicle(
            registrationNo: registrationNo, type: type, owner: vehicleOwner);
        respository.addToList(item: newVehicle);
        printAdd(newVehicle.toString());
        printContinue();
        break;
      case 2: // list vehicle
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('The list of vehicles are empty');
        } else {
          vehicleList.forEach(print);
        }
        printContinue();
        break;
      case 3: // edit vehicle
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('There is no vehicles to edit.');
        } else {
          int editNo = checkIntOption(
              question: 'What number do you want to edit? ',
              maxNumber: vehicleList.length,
              userOptions: vehicleList,
              menu: false);
          Vehicle editVehicle = vehicleList[editNo - 1];
          bool changRegNo = checkBoolOption(
              question: 'Do you want to change registration number? (y?): ');
          if (changRegNo) {
            String regNo = checkInputStringValues(
                question:
                    'What registration number to you want to change to?: ');
            editVehicle.registrationNo = regNo;
          }
          bool changeType =
              checkBoolOption(question: 'Do you want to change type (y?): ');
          if (changeType) {
            printListInfo('This is the types you can add:');
            int vehicleTypeIndex = checkIntOption(
                question: 'What type to you want to change to?: ',
                maxNumber: VehicleType.values.length,
                userOptions: VehicleType.values,
                menu: false);
            editVehicle.type = VehicleType.values[vehicleTypeIndex - 1];
          }
          bool changeOwner =
              checkBoolOption(question: 'Do you want to change owner (y?): ');
          if (changeOwner) {
            if (ownerList.isEmpty) {
              print('No owner to change to');
            } else {
              printListInfo('This is the owners you can add:');
              int ownerIndex = checkIntOption(
                  question:
                      'Enter number of the owner you would like to add to this vehicle: ',
                  maxNumber: ownerList.length,
                  userOptions: ownerList,
                  menu: false);
              Owner vehicleOwner = ownerList[ownerIndex - 1];
              editVehicle.owner = vehicleOwner;
            }
          }
          respository.update(index: editNo - 1, item: editVehicle);
          printAction('Vehicle has been updated');
        }
        printContinue();
        break;
      case 4: // remove vehicle
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('There is no vehicles to remove.');
        } else {
          int removeNo = checkIntOption(
              question: 'What number do you want to remove? ',
              maxNumber: vehicleList.length,
              userOptions: vehicleList,
              menu: false);
          respository.remove(index: removeNo - 1);
          printAction('List of vehicles has been updated.');
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
