final userTable = 'user';

class UserFields {
  static final String id = '_id';
  static final String username = 'username';
  static final String password = 'password';
}

class User {
  final int? id;
  final String username;
  final String password;

  User({
    this.id,
    required this.username,
    required this.password,
  });

  User.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        username = res["username"],
        password = res["password"];

  Map<String, Object?> toMap() {
    return {'id': id, 'username': username, 'password': password};
  }
}
