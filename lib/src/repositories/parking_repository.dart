import 'dart:convert';
import 'dart:io';

import 'package:dart_assignment1/src/repositories/repository.dart';
import 'package:dart_assignment1/src/models/parking.dart';

class ParkingRespository extends Repository<Parking> {
  static final ParkingRespository _instance = ParkingRespository._internal();

  ParkingRespository._internal();

  factory ParkingRespository() => _instance;

  @override
  Parking getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }

  @override
  void readJsonFile(String filePath) {
    const JsonDecoder decoder = JsonDecoder();
    final storage = File(filePath);
    var jsonString = storage.readAsStringSync();
    final Map<String, dynamic> jsonmap = decoder.convert(jsonString);

    List<dynamic> parkings = jsonmap['parkings'];

    for (var item in parkings) {
      addToList(item: Parking.fromJson(item));
    }
  }
}
