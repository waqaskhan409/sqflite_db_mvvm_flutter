import 'package:flutter/material.dart';
import 'package:mvvmflutter/model/stuff.dart';
import 'package:mvvmflutter/ui/home/home_viewmodel.dart';
import 'package:mvvmflutter/ui/widgets/consumers.dart';
import 'package:provider/provider.dart';


//THis is the 1st layer MVVM Architecture (Pattern Design), Where we only displaying the widgets no data manipulating at this layer.
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
//      This is the floating button just push the dummy data to view model layer
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
      //THis is our body, which contain the Consumer widget which contains the list.
      body: ConsumerHome()
    );
  }
}
