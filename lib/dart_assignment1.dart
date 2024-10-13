import 'dart:io';
import 'dart:convert';

import 'package:dart_assignment1/src/models/owner.dart';
import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:dart_assignment1/src/models/parking.dart';
import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/owner_screen.dart';
import 'package:dart_assignment1/src/utils/menu_choices.dart';
import 'package:dart_assignment1/src/vehicle_screen.dart';
import 'package:dart_assignment1/src/parking_lot_screen.dart';
import 'package:dart_assignment1/src/parking_screen.dart';
import 'package:dart_assignment1/src/repositories/owner_repository.dart';
import 'package:dart_assignment1/src/repositories/parking_lot_repository.dart';
import 'package:dart_assignment1/src/repositories/parking_repository.dart';
import 'package:dart_assignment1/src/repositories/vehicle_repository.dart';
import 'package:dart_assignment1/src/utils/effects.dart';

List<String> userOptions = [
  '1. Owners',
  '2. Vehicles',
  '3. Parkinglots',
  '4. Parkings',
  'q. Quit'
];

const JsonDecoder decoder = JsonDecoder();
String filePath = 'db/storage.json';

void readFromFile() {
  OwnerRespository ownerRespository = OwnerRespository();
  ownerRespository.readJsonFile(filePath);

  VehicleRespository vehicleRespository = VehicleRespository();
  vehicleRespository.readJsonFile(filePath);

  ParkingLotRespository parkinglotRespository = ParkingLotRespository();
  parkinglotRespository.readJsonFile(filePath);

  ParkingRespository parkingRespository = ParkingRespository();
  parkingRespository.readJsonFile(filePath);
}

void createParkingCli() {
  readFromFile();

  clearScreen();
  printGreeting('Welcome to FindMeASpot!');
  int? userInput;

  while (userInput != 5) {
    stdout.writeln('What do you want to do? ');
    userInput = checkIntOption(
        question: 'Choose an option (1-4): ',
        maxNumber: 4,
        userOptions: userOptions,
        menu: true);
    switch (userInput) {
      case 1:
        ownerScreen();
        break;
      case 2:
        vehicleScreen();
        break;
      case 3:
        parkingLotScreen();
        break;
      case 4:
        parkingScreen();
        break;
      default:
        break;
    }
  }

  exitCli();
}
