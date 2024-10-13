import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class VehicleRespository extends Repository<Vehicle> {
  static final VehicleRespository _instance = VehicleRespository._internal();

  VehicleRespository._internal();

  // static VehicleRespository get instance =>
  //     _instance; // användning => VehicleRespository.instance.add(Vehicle("Bob", 23));
  factory VehicleRespository() =>
      _instance; // användning => VehicleRespository.add(Vehicle("Bob", 23));

  @override
  Vehicle getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
