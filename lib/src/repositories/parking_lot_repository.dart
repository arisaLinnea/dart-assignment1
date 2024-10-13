import 'package:dart_assignment1/src/models/parkinglot.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class ParkingLotRespository extends Repository<ParkingLot> {
  static final ParkingLotRespository _instance =
      ParkingLotRespository._internal();

  ParkingLotRespository._internal();

  // static ParkingLotRespository get instance =>
  //     _instance; // användning => ParkingLotRespository.instance.add(Owner("Bob", 23));
  factory ParkingLotRespository() =>
      _instance; // användning => ParkingLotRespository.add(Owner("Bob", 23));

  @override
  ParkingLot getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
