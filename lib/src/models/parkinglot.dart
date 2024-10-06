import 'package:uuid/uuid.dart';

class Address {
  String _street;
  String _zipCode;
  String _city;

  Address(this._street, this._zipCode, this._city);

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(json['street'], json['zipCode'], json['city']);
  }

  @override
  String toString() {
    return '$_street, $_zipCode $_city';
  }
}

class ParkingLot {
  String _id;
  Address _address;
  int _hourlyPrice;

  ParkingLot({required Address address, required int hourlyPrice, String? id})
      : _id = id ?? Uuid().v4(),
        _address = address,
        _hourlyPrice = hourlyPrice;

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    return ParkingLot(
        id: json['id'],
        address: json['address'] ?? Address.fromJson(json['owner']),
        hourlyPrice: json['hourlyPrice']);
  }

  Map<String, dynamic> toJson() =>
      {'id': _id, 'address': _address.toString(), 'hourlyPrice': _hourlyPrice};
}
