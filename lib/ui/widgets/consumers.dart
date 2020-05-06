import 'package:flutter/material.dart';
import 'package:mvvmflutter/model/constants.dart';
import 'package:mvvmflutter/ui/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class ConsumerHome extends StatefulWidget {
  @override
  _ConsumerHomeState createState() => _ConsumerHomeState();
}

class _ConsumerHomeState extends State<ConsumerHome> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child){
        return ListView.builder(
            itemCount: model.list.length,
            itemBuilder: (_, i){
              return Card(
                child: Row(
                  children: [
                    Text(model.list[i][Constants.COLUMN_2_STUFF]),
                    Text(model.list[i][Constants.COLUMN_1_APPLIANCES].toString()),
                    Text(model.list[i][Constants.COLUMN_2_APPLIANCES].toString()),
                  ],
                ),
              );
            });;
      },
    );
  }
}
