import 'package:uuid/uuid.dart';

import 'owner.dart';

enum VehicalType { Car, MC, Bicycle, Moped, Tractor }

class Vehicle {
  String _id;
  String _registrationNo;
  VehicalType _type;
  Owner _owner;

  // Vehicle(this.registrationNo, this.type, this.owner);
  Vehicle(
      {required String registrationNo,
      required VehicalType type,
      required Owner owner,
      String? id})
      : _id = id ?? Uuid().v4(),
        _registrationNo = registrationNo,
        _type = type,
        _owner = owner;

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      registrationNo: json['registrationNo'],
      type: json['type'],
      owner: json['owner'] ?? Owner.fromJson(json['owner']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'registrationNo': _registrationNo,
        'type': _type,
        'owner': _owner.toJson()
      };
}
