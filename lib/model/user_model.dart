class UserModel {
  final String status, msg;
  final List<Users> users;

  UserModel({
    required this.status,
    required this.users,
    required this.msg,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    var data;
    if (parsedJson['status'] == "success") {
      var list = parsedJson['user_list'] as List;
      List<Users> uList =
          list.map((i) => Users.fromJson(i)).toList();
      data = UserModel(
        status: parsedJson['status'],
        users: uList,
        msg: '',
      );
    } else {
      data = UserModel(
        status: parsedJson['status'],
        msg: parsedJson['msg'],
        users: [],
      );
    }
    return data;
  }
}

class Users {
  final String name, email;
  Users({
    required this.email,
    required this.name,

  });

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    return Users(
     
      email: parsedJson['email'],
      name: parsedJson['name'],
    );
  }
}


