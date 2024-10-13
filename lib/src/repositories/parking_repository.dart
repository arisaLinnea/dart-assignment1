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
}
