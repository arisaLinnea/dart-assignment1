import 'dart:convert';
import 'dart:io';

import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class VehicleRespository extends Repository<Vehicle> {
  static final VehicleRespository _instance = VehicleRespository._internal();

  VehicleRespository._internal();

  factory VehicleRespository() => _instance;

  @override
  Vehicle getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }

  @override
  void readJsonFile(String filePath) {
    const JsonDecoder decoder = JsonDecoder();
    final storage = File(filePath);
    var jsonString = storage.readAsStringSync();
    final Map<String, dynamic> jsonmap = decoder.convert(jsonString);

    List<dynamic> vehicles = jsonmap['vehicles'];

    for (var item in vehicles) {
      addToList(item: Vehicle.fromJson(item));
    }
  }
}
