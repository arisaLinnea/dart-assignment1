import 'dart:convert';
import 'dart:io';

import 'package:dart_assignment1/src/models/owner.dart';
import 'package:dart_assignment1/src/repositories/repository.dart';

class OwnerRespository extends Repository<Owner> {
  static final OwnerRespository _instance = OwnerRespository._internal();

  OwnerRespository._internal();

  factory OwnerRespository() => _instance;

  @override
  Owner getElementById({required String id}) {
    return getList().firstWhere((element) => element.id == id);
  }

  @override
  void readJsonFile(String filePath) async {
    const JsonDecoder decoder = JsonDecoder();
    final storage = File(filePath);
    var jsonString = storage.readAsStringSync();
    final Map<String, dynamic> jsonmap = decoder.convert(jsonString);

    List<dynamic> owners = jsonmap['owners'];

    for (var item in owners) {
      addToList(item: Owner.fromJson(item));
    }
  }
}
