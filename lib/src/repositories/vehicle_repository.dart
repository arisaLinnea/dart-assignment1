import 'package:dart_assignment1/src/models/vehicle.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class VehicleRespository extends Repository<Vehicle> {
  static final VehicleRespository _instance = VehicleRespository._internal();

  VehicleRespository._internal();

  factory VehicleRespository() => _instance;

  @override
  Vehicle getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
