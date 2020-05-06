
import 'package:flutter/material.dart';
import 'package:mvvmflutter/databases/appliances_db.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:mvvmflutter/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier{
//  List<Stuff> stuff = List();
  HomeRepository repository = HomeRepository();
  AppliancesDb appliancesDb = AppliancesDb();
  List<Map> list ;

  Future<void> fetchStuff() async {
     repository.retrieve().then((listItems){
       list = listItems;
       notify();
     });
//     appliancesDb.openDb().then((db){
//       appliancesDb.onRetrieve(db).then((listItem){
//         list = listItem;
//         notify();
//       });
//     });
  }

  void insertStuff(Stuff stuff) async {
     repository.insert(stuff);
     fetchStuff();
  }

  Future<void> deleteStuff(Stuff stuff) async{

//    notifyListeners();
  }

  notify(){
    notifyListeners();
  }


//  void deleteStuff(Stuff stuff){
//    repository.onDelete(stuff);
//  }





}