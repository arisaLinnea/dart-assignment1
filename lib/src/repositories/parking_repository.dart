import 'package:dart_assignment1/src/repositories/repository.dart';
import 'package:dart_assignment1/src/models/parking.dart';

class ParkingRespository extends Repository<Parking> {
  static final ParkingRespository _instance = ParkingRespository._internal();

  ParkingRespository._internal();

  // static ParkingRespository get instance =>
  //     _instance; // användning => ParkingRespository.instance.add(Owner("Bob", 23));
  factory ParkingRespository() =>
      _instance; // användning => ParkingRespository.add(Owner("Bob", 23));

  @override
  Parking getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
