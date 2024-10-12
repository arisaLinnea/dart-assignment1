import 'dart:io';

import 'package:dart_assignment1/src/models/Owner.dart';
import 'package:dart_assignment1/src/models/Vehicle.dart';
import 'package:dart_assignment1/src/repositories/owner_repository.dart';
import 'package:dart_assignment1/src/repositories/vehicle_repository.dart';
import 'package:dart_assignment1/src/utils/effects.dart';
import 'package:dart_assignment1/src/utils/menu_choices.dart';

Set<String> userOptions = {
  '1. Create a new vehicle',
  '2. Show me all vehicles',
  '3. Edit a vehicle',
  '4. Remove a vehicle',
  '5. Go back to start screen',
  '6. Quit',
};

void vehicleScreen() {
  VehicleRespository respository = VehicleRespository();
  OwnerRespository ownerRespository = OwnerRespository();
  int? userInput;
  clearScreen();

  while (userInput != 5) {
    printGreeting('You can now administrate vehicles. What do you wanna do?');
    userOptions.forEach(stdout.writeln);
    userInput =
        checkIntOption(question: 'Choose an option (1-5): ', maxNumber: 6);
    clearScreen();
    printGreeting('You chose: ${userOptions.elementAt(userInput - 1)}');
    switch (userInput) {
      case 1: // add vehicle
        List<Owner> ownerList = ownerRespository.getList();
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

        for (final (index, type) in VehicalType.values.indexed) {
          print("${index + 1}. $type");
        }

        int vehicalTypeIndex = checkIntOption(
            question: 'Type for new vehicle: ',
            maxNumber: VehicalType.values.length);
        VehicalType type = VehicalType.values[vehicalTypeIndex - 1];
        // ownerList.forEach(print);
        for (final (index, item) in ownerList.indexed) {
          print("${index + 1}. $item");
        }
        int ownerIndex = checkIntOption(
            question:
                'Enter number of the owner you would like to add to this vehicle: ',
            maxNumber: ownerList.length);
        Owner vehicleOwner = ownerList[ownerIndex - 1];

        Vehicle newVehicle = Vehicle(
            registrationNo: registrationNo, type: type, owner: vehicleOwner);
        print(newVehicle.toString());
        respository.addToList(item: newVehicle, id: newVehicle.id);
        printContinue();
        break;
      case 2: // list owner
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('The list of vehicles are empty');
        } else {
          vehicleList.forEach(print);
        }
        printContinue();
        break;
      case 3: // edit owner
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('There is no vehicles to edit.');
        } else {
          for (final (index, item) in vehicleList.indexed) {
            print("${index + 1}. $item");
          }
          int editNo = checkIntOption(
              question: 'What number do you want to edit? ',
              maxNumber: vehicleList.length);
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
            for (final (index, type) in VehicalType.values.indexed) {
              print("${index + 1}. $type");
            }

            int vehicalTypeIndex = checkIntOption(
                question: 'What type to you want to change to?: ',
                maxNumber: VehicalType.values.length);
            editVehicle.type = VehicalType.values[vehicalTypeIndex - 1];
          }
          bool changeOwner =
              checkBoolOption(question: 'Do you want to change owner (y?): ');
          if (changeOwner) {
            List<Owner> ownerList = ownerRespository.getList();
            if (ownerList.isEmpty) {
              print('No owner to change to');
            } else {
              for (final (index, item) in ownerList.indexed) {
                print("${index + 1}. $item");
              }
              int ownerIndex = checkIntOption(
                  question:
                      'Enter number of the owner you would like to add to this vehicle: ',
                  maxNumber: ownerList.length);
              Owner vehicleOwner = ownerList[ownerIndex - 1];
              editVehicle.owner = vehicleOwner;
            }
          }
          respository.update(index: editNo - 1, item: editVehicle);
          print('Vehicle has been updated');
        }
        printContinue();
        break;
      case 4: // remove owner
        List<Vehicle> vehicleList = respository.getList();
        if (vehicleList.isEmpty) {
          print('There is no vehicles to remove.');
        } else {
          for (final (index, item) in vehicleList.indexed) {
            print("${index + 1}. $item");
          }
          int removeNo = checkIntOption(
              question: 'What number do you want to remove? ',
              maxNumber: vehicleList.length);
          respository.remove(index: removeNo - 1);
          print('List of vehicles has been updated.');
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
