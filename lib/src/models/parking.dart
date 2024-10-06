import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:uuid/uuid.dart';

class Parking {
  String _id;
  Vehicle _vehicle;
  ParkingLot _parkinglot;
  String _startTime;
  String? _endTime;

  Parking(
      {required Vehicle vehicle,
      required ParkingLot parkinglot,
      required String startTime,
      String? endTime,
      String? id})
      : _id = id ?? Uuid().v4(),
        _vehicle = vehicle,
        _parkinglot = parkinglot,
        _startTime = startTime,
        _endTime = endTime;

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
        id: json['id'],
        vehicle: json['vehicle'] ?? Vehicle.fromJson(json['vehicle']),
        parkinglot:
            json['parkinglot'] ?? ParkingLot.fromJson(json['parkinglot']),
        startTime: json['startTime'],
        endTime: json['endTime']);
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'vehicle': _vehicle.toJson(),
        'parkinglot': _parkinglot.toJson(),
        'startTime': _startTime,
        'endTime': _endTime
      };
}
