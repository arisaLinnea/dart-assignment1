import 'package:dart_assignment1/src/models/Owner.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class OwnerRespository extends Repository {
  final Map<String, Owner> _owners = {};
  @override
  void addToList(item) {
    _owners[item.id] = item;
  }

  @override
  Owner getElementById(int id) {
    // TODO: implement getElementById
    throw UnimplementedError();
  }

  @override
  Map<String, Owner> getList() {
    return _owners;
  }

  @override
  void remove(id) {
    // TODO: implement remove
  }

  @override
  void update(item) {
    // TODO: implement update
  }
}
