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

void readFromFile() {
  OwnerRespository ownerRespository = OwnerRespository();
  VehicleRespository vehicleRespository = VehicleRespository();
  ParkingLotRespository parkinglotRespository = ParkingLotRespository();
  ParkingRespository parkingRespository = ParkingRespository();

  final storage = File('db/storage.json');
  var jsonString = storage.readAsStringSync();
  final Map<String, dynamic> jsonmap = decoder.convert(jsonString);

  List<dynamic> owners = jsonmap["owners"];
  List<dynamic> vehicles = jsonmap["vehicles"];
  List<dynamic> parkinglots = jsonmap["parkinglots"];
  List<dynamic> parkings = jsonmap["parkings"];

  for (var item in owners) {
    ownerRespository.addToList(item: Owner.fromJson(item));
  }
  for (var item in vehicles) {
    vehicleRespository.addToList(item: Vehicle.fromJson(item));
  }
  for (var item in parkinglots) {
    parkinglotRespository.addToList(item: ParkingLot.fromJson(item));
  }
  for (var item in parkings) {
    parkingRespository.addToList(item: Parking.fromJson(item));
  }
}

void createParkingCli() {
  // readFromFile();

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
