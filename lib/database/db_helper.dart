import 'package:sqflite/sqflite.dart';
import 'package:sqlite_db/models/contact_model.dart';

class DBHelper {
  static Database? _database;
  static final String _tableName = "contactData";
  static final int _databaseVersion = 1;

  static const String id = "id";
  static const String name = "name";
  static const String image = "image";
  static const String phone = "phone";
  static const String altrphone = "altrphone";
  static const String email = "email";
  static const String blood = "blood";
  static const String address = "address";
  static const String relation = "relation";
  static const String favourite = "favourite";

  static Future<Database?> get getDatabase async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  static Future<Database> initDatabase() async {
    var dir = await getDatabasesPath();
    String path = dir + _tableName+".db";
    var database = await openDatabase(path, version: _databaseVersion,
        onCreate: (database, version) {
      database.execute('''
        create table $_tableName(
        $id INTEGER PRIMARY KEY AUTOINCREMENT,
        $name text not null,
        $image text,
        $phone text not null,
        $altrphone text,
        $email text not null,
        $blood text,
        $address text,
        $relation text,
        $favourite int not null
        )
        ''');
    });
    return database;
  }


  static Future<int> insert(ContactData contactData)async{
    var db = await getDatabase;
    var insertCheck = await db!.insert(_tableName, contactData.toJson());
    //print("insertCheck: $insertCheck");
    return insertCheck;
  }

  static Future<List<Map<String, dynamic>>> fetchData()async{
    var db = await getDatabase;
    var fetchCheck = await db!.query(_tableName);
    //print("fetchCheck: $fetchCheck");
    return fetchCheck;
  }

  // static Future<int> updateData(int? id)async{
  //   var db = await getDatabase;
  //   return await db!.rawUpdate('''
  //   UPDATE contactData
  //   SET isCompleted = ?
  //   Where id = ?
  //   ''', [1,id]);
  // }

  static Future<int> updateData(ContactData contactData)async{
    var db = await getDatabase;
    return await db!.update(_tableName, contactData.toJson(), where: "id = ?", whereArgs: [contactData.id]);
  }

  static Future<int> delete(ContactData contactData)async{
    var db = await getDatabase;
    return await db!.delete(_tableName, where: "id = ?", whereArgs: [contactData.id]);
  }
}
