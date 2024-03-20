import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DbHandler {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'CashFlowdb11.db');

    _database=await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Customers(
            custId INTEGER PRIMARY KEY,
            firstname VARCHAR(255) NOT NULL,
            lastname VARCHAR(255) NOT NULL,
            address VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL UNIQUE,
            phoneNumber VARCHAR(11) NOT NULL UNIQUE,
            cnic VARCHAR(13) NOT NULL UNIQUE,
            password TEXT 
          )
''');
      },
    );


    return _database;
  }

  insertData(
      String table,
      String firstName,
      String lastName,
      String address,
      String email,
      String number,
      String cnic,
      String password) async {
    //getting database    
    Database? db = await database;

    //converting values to map for insert function
    final Map<String,dynamic> values={
      "custId":1,
      "firstName":firstName,
      "lastName":lastName,
      "address":address,
      "email":email,
      "phoneNumber":number,
      "cnic":cnic,
      "password":password
    };

    //inserting values
    db!.insert("Customers", values);

  }

  readData(String table) async {
    Database? db = await database;
    final list = await db!.query(table);
    return list;
  }
}
