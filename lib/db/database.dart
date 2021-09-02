import 'package:findmehouse_test/modele/user.dart';
import 'package:findmehouse_test/services/outils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
//intialize data base(creating data base and user table)
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          '''CREATE TABLE $userTable (
            ${UserFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
            ${UserFields.username} TEXT NOT NULL,
            ${UserFields.password} INTEGER NOT NULL)''',
        );
      },
      version: 1,
    );
  }

//insert users in user table
  Future<int> insertUser(List<User> users) async {
    int result = 0;
    final Database db = await initializeDB();
    for (var user in users) {
      result = await db.insert(userTable, user.toMap());
    }
    return result;
  }

//get list of users
  Future<List<User>> retrieveUsers() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(userTable);
    return queryResult.map((e) => User.fromMap(e)).toList();
  }

//get user
  Future<User> authification(User user, context) async {
    final db = await initializeDB();
    User emptyUuser = new User(id: 0, username: '', password: '');
    final maps = await db.query(
      userTable,
      where: "${UserFields.username} = ?",
      whereArgs: [user.username],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      return emptyUuser;
    }
  }
}
