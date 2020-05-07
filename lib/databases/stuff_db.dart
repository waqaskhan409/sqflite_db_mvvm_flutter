//Code written in home_repository class because, the table contaning one table. But, now two tables i-e Stuff and Repository...

import 'package:mvvmflutter/model/appliances.dart';
import 'package:mvvmflutter/model/constants.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:sqflite/sqflite.dart';

import 'appliances_db.dart';

class StuffDb{


  //This is function is just return the Database instance/object, inorder to maintain the changes in local database.
  Future<Database> openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + Constants.DB_NAME;

    Database database = await openDatabase(path, version: Constants.DB_VERSION,
        onCreate: (Database db, int version) async {
          await db
              .execute(
              'CREATE TABLE ${Constants.TABLE_NAME_STUFF}'
                  ' (${Constants.COLUMN_1_STUFF} INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' ${Constants.COLUMN_2_STUFF} TEXT,'
                  ' ${Constants.COLUMN_3_STUFF} TEXT,'
                  ' ${Constants.COLUMN_4_STUFF} TEXT,'
                  ' ${Constants.COLUMN_5_STUFF} INTEGER,'
                  ' ${Constants.COLUMN_6_STUFF} INTEGER )');


        });

    return database;
  }


  /*
  This method is for pushing the value to the stuff table
   */
  void onAdd(Stuff stuff, Database database) async {
    int okey = stuff.isOkay ? 1 : 0;
    int idle = stuff.isIdle ? 1 : 0;

    final transaction = await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO ${Constants.TABLE_NAME_STUFF}(${Constants.COLUMN_2_STUFF},'
              '${Constants.COLUMN_3_STUFF},'
              '${Constants.COLUMN_4_STUFF},'
              '${Constants.COLUMN_5_STUFF},'
              '${Constants.COLUMN_6_STUFF}'
              ') VALUES("${stuff.name}", "${stuff.description}", "${stuff.purpose}", $okey , $idle)');
      print('inserted1: $id1');
      final applianceDb = AppliancesDb();
      applianceDb.openDb().then((db) => {
//      This line is for pushing the value to the appliance table, you can comment this to moniter the changes
        applianceDb.onAdd(Appliances(0, id1, "sholombo khan $id1", true), db)

      });
    });

    return transaction;

  }


  // THis function is for retrieving data from Appliance because appliance table is dependent to stuff thats why we can retrieve all the from stuff table and appliance table via INNER JOINS
  Future<List<Stuff>> onRetrieve(Database database) async {
    List<Stuff> stuffList = new List();
    List<Map> list = await database.rawQuery('SELECT * FROM ${Constants.TABLE_NAME_STUFF}');
    //we can explicitly use map functions to convert the objects map object to the list but due to time constraint i prefere this way.
    for (Map listStuff in list) {
      Stuff stuff = Stuff(
          listStuff[Constants.COLUMN_1_STUFF],
          listStuff[Constants.COLUMN_2_STUFF],
          listStuff[Constants.COLUMN_3_STUFF],
          listStuff[Constants.COLUMN_4_STUFF],
          listStuff[Constants.COLUMN_5_STUFF] == 1 ? true : false,
          listStuff[Constants.COLUMN_6_STUFF] == 1 ? true : false);
      stuffList.add(stuff);
    }


    return stuffList;
  }


}