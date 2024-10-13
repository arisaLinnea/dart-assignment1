import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:uuid/uuid.dart';

class Parking {
  String _id;
  Vehicle _vehicle;
  ParkingLot _parkinglot;
  DateTime _startTime;
  DateTime? _endTime;

  Parking(
      {required Vehicle vehicle,
      required ParkingLot parkinglot,
      required DateTime startTime,
      DateTime? endTime,
      String? id})
      : _id = id ?? Uuid().v4(),
        _vehicle = vehicle,
        _parkinglot = parkinglot,
        _startTime = startTime,
        _endTime = endTime;

  String get id => _id;

  set vehicle(Vehicle value) {
    _vehicle = value;
  }

  set parkingLot(ParkingLot value) {
    _parkinglot = value;
  }

  set startTime(DateTime value) {
    _startTime = value;
  }

  set endTime(DateTime value) {
    _endTime = value;
  }

  factory Parking.fromJson(Map<String, dynamic> json) {
    return Parking(
        id: json['id'],
        vehicle: json['vehicle'] ?? Vehicle.fromJson(json['vehicle']),
        parkinglot:
            json['parkinglot'] ?? ParkingLot.fromJson(json['parkinglot']),
        startTime: DateTime.parse(json['startTime']),
        endTime: json['endTime'] ?? DateTime.parse(json['startTime']));
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'vehicle': _vehicle.toJson(),
        'parkinglot': _parkinglot.toJson(),
        'startTime': _startTime
            .toIso8601String(), // Convert DateTime to ISO 8601 string,
        'endTime': _endTime?.toIso8601String()
      };

  @override
  String toString() {
    return 'Vehicle: ${_vehicle.toString()}, Parking lot: ${_parkinglot.toString()}, $_startTime';
  }
}
