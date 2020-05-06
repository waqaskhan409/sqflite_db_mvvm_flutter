import 'package:mvvmflutter/databases/appliances_db.dart';
import 'package:mvvmflutter/databases/stuff_db.dart';
import 'package:mvvmflutter/model/appliances.dart';
import 'package:mvvmflutter/model/constants.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:sqflite/sqflite.dart';

class HomeRepository {
  List<Stuff> _stuff = new List();
  Database database;
  AppliancesDb appliancesDb;
  StuffDb stuffDb;

  HomeRepository() {
    stuffDb = StuffDb();
    appliancesDb = AppliancesDb();
  }


  void insert(Stuff stuff){
    stuffDb.openDb().then((db){
      stuffDb.onAdd(stuff, db);
    });
  }

  Future<List<Map>> retrieve() async {
    Database databse = await appliancesDb.openDb();
    return appliancesDb.onRetrieve(databse);
  }


  void delete(){

  }
}
