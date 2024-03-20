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
    String path = join(directory.path, 'CashFlowdb17.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        //customer table
        await db.execute('''
          CREATE TABLE Customers(
            custId INTEGER PRIMARY KEY AUtOINCREMENT,
            firstName VARCHAR(255) NOT NULL,
            lastName VARCHAR(255) NOT NULL,
            address VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL UNIQUE,
            phoneNumber VARCHAR(11) NOT NULL UNIQUE,
            cnic VARCHAR(13) NOT NULL UNIQUE,
            password VARCHAR(255) 
          )
''');

//Account table
 await db.execute('''
          CREATE TABLE Account(
            accountId VARCHAR(255) PRIMARY KEY,
            balance INTEGER NOT NULL,
            type VARCHAR(255) NOT NULL DEFAULT 'Saving' ,
            custId INTEGER NOT NULL,
            FOREIGN KEY(custId) REFERENCES Customers(custId)
          )
''');

//inserting data for testing purpose customer
await db.execute('''
  INSERT INTO Customers(
    firstName,
    lastName,
    address,
    email,
    phoneNumber,
    cnic,
    password
  ) VALUES ("Abdul Majeed","Faraz","Building 4c","faraz@gmail.com","03156247856","3287596145254","faraz123")
''');

//account

  await db.execute('''
  INSERT INTO Account(
    accountId,
    balance,
    type,
    custId
  ) VALUES ("PKRCF00001",50000,"Saving",1)
''');
      },
    );

    return _database;
  }

  insertData(String table, String firstName, String lastName, String address,
      String email, String number, String cnic, String password) async {
    //getting database
    Database? db = await database;

    //converting values to map for insert function
    final Map<String, dynamic> values = {
      // "custId": 1,
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "email": email,
      "phoneNumber": number,
      "cnic": cnic,
      "password": password
    };

    //inserting values
    db!.insert("Customers", values);
  }

  Future<List<Map<String, dynamic>>> readData(String table) async {
    Database? db = await database;
    final list = await db!.query(table);
    return list;
  }
}
