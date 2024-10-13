import 'package:dart_assignment1/src/models/owner.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class OwnerRespository extends Repository<Owner> {
  static final OwnerRespository _instance = OwnerRespository._internal();

  OwnerRespository._internal();

  // static OwnerRespository get instance =>
  //     _instance; // användning => OwnerRespository.instance.add(Owner("Bob", 23));
  factory OwnerRespository() =>
      _instance; // användning => OwnerRespository.add(Owner("Bob", 23));

  @override
  Owner getElementById({required String id}) {
    return super.getList().firstWhere((element) => element.id == id);
  }
}
