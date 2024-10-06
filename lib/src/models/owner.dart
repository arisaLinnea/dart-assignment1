import 'package:uuid/uuid.dart';

class Owner {
  String _id;
  String _name;
  String _ssn;

  // Owner(this.name, this.ssn, [String? id]) : id = id ?? Uuid().v4();
  Owner({required String name, required String ssn, String? id})
      : _id = id ?? Uuid().v4(),
        _name = name,
        _ssn = ssn;

  String get id {
    return _id;
  }

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      id: json['id'],
      name: json['name'],
      ssn: json['description'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': _id,
        'name': _name,
        'ssn': _ssn,
      };

  @override
  String toString() {
    return 'Name: $_name, ssn: $_ssn';
  }

  bool isValid() {
    return true;
  }
}
