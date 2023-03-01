// ignore_for_file: unnecessary_getters_setters

class UserModel {
  String userId;
  String userName;
  String email;
  String password;

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

  fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    userName = map['userName'];
    email = map['email'];
    password = map['password'];
  }
}
