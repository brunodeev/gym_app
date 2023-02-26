// ignore_for_file: unnecessary_getters_setters

class User {
  int _id;
  String _name;
  String _email;
  int _age;
  double _weight;
  String _phone;

  User(this._id, this._name, this._email, this._age, this._weight, this._phone);

  int get id => _id;
  set id(int value) => _id = value;

  String get name => _name;
  set name(String value) => _name = value;

  String get email => _email;
  set email(String value) => _email = value;

  int get age => _age;
  set age(int value) => _age = value;

  double get weight => _weight;
  set weight(double value) => _weight = value;

  String get phone => _phone;
  set phone(String value) => _phone = value;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['age'] = _age;
    map['weight'] = _weight;
    map['phone'] = _phone;

    return map;
  }

  fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _name = map['name'];
    _email = map['email'];
    _age = map['age'];
    _weight = map['weight'];
    _phone = map['phone'];
  }
}
