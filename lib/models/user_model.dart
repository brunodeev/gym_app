// ignore_for_file: unnecessary_getters_setters

class UserModel {
  late String userId;
  late String userName;
  late String email;
  late String password;

  UserModel(this.userId, this.userName, this.email, this.password);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'userId': userId,
      'userName': userName,
      'email': email,
      'password': password,
    };
    return map;
  }

  UserModel.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}
