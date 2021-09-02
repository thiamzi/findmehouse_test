final userTable = 'users';

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
      : id = res["_id"],
        username = res["username"],
        password = res["password"].toString();

  Map<String, Object?> toMap() {
    return {'_id': id, 'username': username, 'password': password};
  }
}
