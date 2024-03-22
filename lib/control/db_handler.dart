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
    String path = join(directory.path, 'CashFlowdb26.db');

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
            phoneNumber INTEGER(11) NOT NULL UNIQUE,
            cnic INTEGER(13) NOT NULL UNIQUE,
            password VARCHAR(255) 
          )
''');

//Account table
 await db.execute('''
          CREATE TABLE Account(
            accountId VARCHAR(10) PRIMARY KEY,
            balance INTEGER NOT NULL,
            type VARCHAR(255) NOT NULL DEFAULT 'Saving' ,
            custId INTEGER NOT NULL,
            FOREIGN KEY(custId) REFERENCES Customers(custId)
          )
''');

//transaction table
//tranid=trxpkrcf0000100
await db.execute('''
CREATE TABLE Transactions(
  transactionId VARCHAR(18) PRIMARY KEY,
  accountId VARCHAR(10) NOT NULL,
  recieverId VARCHAR(10) NOT NULL,
  name VARCHAR(255) NOT NULL DEFAULT "anBank",
  amount int NOT NULL,
  bank VARCHAR(255),
  FOREIGN KEY(recieverId) REFERENCES ACCOUNT(accountId)
)
''');

//inserting data for testing purpose customer

//customer
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

//2nd customer
await db.execute('''
  INSERT INTO Customers(
    firstName,
    lastName,
    address,
    email,
    phoneNumber,
    cnic,
    password
  ) VALUES ("Abdul Majeed","Faraz","Building 4c","a@gmail.com","03156247858","32875961434","a123")
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


//2ndaccount
  await db.execute('''
  INSERT INTO Account(
    accountId,
    balance,
    type,
    custId
  ) VALUES ("PKRCF00002",50000,"Saving",2)
''');
      },
    );

    return _database;
  }


  //inserting Data into Database
  insertData(String table, Map<String,dynamic> values) async {
    //getting database
    Database? db = await database;

    return db!.insert(table, values);
  }


  ///reading from database
  ///
  Future<List<Map<String, dynamic>>> readData(String table,{String? where,List<Object?>? whereArgs,}) async {
    Database? db = await database;
    final list = await db!.query(table,where: where,whereArgs: whereArgs);
    return list;
  }


  //update data
  updateData(String table,Map<String,dynamic> newData,String where,List<dynamic> whereArgs) async {
    Database? db=await database;
     await db!.update(
    table,
    newData,
    where: where, // Example condition, replace 'id' with the actual primary key column name
    whereArgs: whereArgs, // Example value for the condition
  );
  }

///generating AccoundId
  Future<String> generateAccountId() async {
    Database? db = await database;
    
    // Get the current maximum account ID
    List<Map<String, dynamic>> maxId = await db!.rawQuery('SELECT MAX(CAST(SUBSTR(accountId, 6) AS INTEGER)) AS maxId FROM Account');
    int nextId = (maxId[0]['maxId'] ?? 0) + 1;
    
    // Format the account ID
    String accountId = 'PKRCF${nextId.toString().padLeft(5, '0')}';
    
    return accountId;
  }


  //generating transactioId
  Future<String> generateTransactionId(String accountId) async {
  Database? db = await database;
  
  // Get the current maximum transaction number for the given account ID
  List<Map<String, dynamic>> maxNumber = await db!.rawQuery('SELECT MAX(CAST(SUBSTR(transactionId, 14) AS INTEGER)) AS maxNumber FROM Transactions WHERE accountId = ?', [accountId]);
  int nextNumber = (maxNumber[0]['maxNumber'] ?? 0) + 1;
  // print(nextNumber);
  
  // Format the transaction ID
  String transactionId = 'trx$accountId${nextNumber.toString().padLeft(5, '0')}';

  return transactionId;
}
}
