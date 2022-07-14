import 'constants.dart';

class Person {
  Gender _gender;
  String _name;
  Person({required Gender gender, required String name})
      : _gender = gender,
        _name = name;

  @override
  String toString() {
    return '$_gender, $_name';
  }
}
