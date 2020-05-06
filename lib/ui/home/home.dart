import 'package:flutter/material.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:mvvmflutter/ui/home/home_viewmodel.dart';
import 'package:mvvmflutter/ui/widgets/consumers.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  HomeViewModel homeViewModel;
  List<Stuff> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    homeViewModel.fetchStuff();
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            homeViewModel.insertStuff(Stuff(10, "Gulab", "Plapsldalsd", "For company", true, false));
            homeViewModel.fetchStuff();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ConsumerHome()
    );
  }
}
