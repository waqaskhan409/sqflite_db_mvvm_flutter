
import 'package:flutter/material.dart';
import 'package:mvvmflutter/databases/appliances_db.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:mvvmflutter/repository/home_repository.dart';



// This is 2nd layer MVVM Architecture (Design Pattern), where we manage data from the user end.
class HomeViewModel extends ChangeNotifier{
//  List<Stuff> stuff = List();
  HomeRepository repository = HomeRepository();
  AppliancesDb appliancesDb = AppliancesDb();
  List<Map> list ;


//  This method is for retrieve data from repositry level
  Future<void> fetchStuff() async {
     repository.retrieve().then((listItems){
       list = listItems;
       notify();
     });
  }
// This method is insert the data to the repository
  void insertStuff(Stuff stuff) async {
     repository.insert(stuff);
     fetchStuff();
  }
// To be Implemented
  Future<void> deleteStuff(Stuff stuff) async{

//    notifyListeners();
  }

  // THis will refresh the consumers.
  notify(){
    notifyListeners();
  }


//  void deleteStuff(Stuff stuff){
//    repository.onDelete(stuff);
//  }





}