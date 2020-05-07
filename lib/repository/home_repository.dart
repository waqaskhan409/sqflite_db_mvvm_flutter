import 'package:mvvmflutter/databases/appliances_db.dart';
import 'package:mvvmflutter/databases/stuff_db.dart';
import 'package:mvvmflutter/model/appliances.dart';
import 'package:mvvmflutter/model/constants.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:sqflite/sqflite.dart';
//This is the 3rd layer of MVVM Architecture (Design Pattern) where we can manage our data to the local database as well as network apis. In this case only local database
class HomeRepository {
  List<Stuff> _stuff = new List();
  Database database;
  AppliancesDb appliancesDb;
  StuffDb stuffDb;


  HomeRepository() {
    stuffDb = StuffDb();
    appliancesDb = AppliancesDb();
  }


  //THis method is just the insert the values to tables
  void insert(Stuff stuff){
    stuffDb.openDb().then((db){
      stuffDb.onAdd(stuff, db);
    });
  }

  //This method is just retrieve the data from tables.
  Future<List<Map>> retrieve() async {
    Database databse = await appliancesDb.openDb();
    return appliancesDb.onRetrieve(databse);
  }


  void delete(){

  }
}
