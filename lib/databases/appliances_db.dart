import 'package:mvvmflutter/model/appliances.dart';
import 'package:mvvmflutter/model/constants.dart';
import 'package:sqflite/sqflite.dart';

class AppliancesDb{

  Database database;

  List<Appliances> list;
  AppliancesDb(){
    openDb();
  }

  //This is function is just return the Database instance/object, inorder to maintain the changes in local database. Also, in this table we manage the foreign key constraint to reference the stuff table
  Future<Database> openDb() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + Constants.DB_NAME;
    database = await openDatabase(path, version: Constants.DB_VERSION,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          print("creating Appliance db");
          await db
              .execute(
              'CREATE TABLE ${Constants.TABLE_NAME_APPLIANCE}'
                  ' (${Constants.COLUMN_1_APPLIANCES} INTEGER PRIMARY KEY AUTOINCREMENT,'
                  ' ${Constants.COLUMN_2_APPLIANCES} INTEGER,'
                  ' ${Constants.COLUMN_3_APPLIANCES} TEXT,'
                  ' ${Constants.COLUMN_4_APPLIANCES} INTEGER,'
                  ' FOREIGN KEY(${Constants.COLUMN_2_APPLIANCES}) REFERENCES ${Constants.TABLE_NAME_STUFF}(${Constants.COLUMN_1_STUFF})'
                  ')').catchError((onError){
                    print(onError);
          });
        });
    return database;
  }

  /*
  This method is for pushing the value to the appliance table.
   */
  void onAdd(Appliances appliances, Database database) async {

    int isSimple = appliances.is_simple ? 1 : 0;

    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO ${Constants.TABLE_NAME_APPLIANCE}(${Constants.COLUMN_2_APPLIANCES},'
              '${Constants.COLUMN_3_APPLIANCES},'
              '${Constants.COLUMN_4_APPLIANCES}'
              ') VALUES("${appliances.stuff_id}", "${appliances.appliance_name}", $isSimple )');
      print('inserted1: $id1');
    });

  }



  // THis function is for retrieving data from Appliance because appliance table is dependent to stuff thats why we can retrieve all the from stuff table and appliance table via INNER JOINS
  Future<List<Map>> onRetrieve(Database database) async {
    List<Map> list = await database.rawQuery('SELECT * FROM ${Constants.TABLE_NAME_APPLIANCE}'
        ' INNER JOIN ${Constants.TABLE_NAME_STUFF}'
        ' ON ${Constants.TABLE_NAME_APPLIANCE}.${Constants.COLUMN_2_APPLIANCES} = ${Constants.TABLE_NAME_STUFF}.${Constants.COLUMN_1_STUFF}'
        '');
    print(list);
    return list;
  }





}