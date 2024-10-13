import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class ParkingLotRespository extends Repository<ParkingLot> {
  static final ParkingLotRespository _instance =
      ParkingLotRespository._internal();

  ParkingLotRespository._internal();

  factory ParkingLotRespository() => _instance;

  @override
  ParkingLot getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
