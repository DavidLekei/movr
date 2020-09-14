import 'package:flutter/material.dart';
import 'dart:async';

import 'package:movr/pages/SelectGenresPage.dart';
import '../components/ServiceButton.dart';
import '../util/UserSelections.dart' as UserSelections;

class SelectServicesPage extends StatefulWidget{

  @override
  _SelectServicesPageState createState() => _SelectServicesPageState();
}

class _SelectServicesPageState extends State<SelectServicesPage>{

  List<String> services = UserSelections.services;

  void checkButtonPressed(List<String> services)
  {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectGenresPage()));
  }

  Future<bool> backPressed() async{
    print("Back Pressed");
    UserSelections.services.clear();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Select the Services you have'),
          leading: new IconButton( icon: Icon(Icons.arrow_back), onPressed: backPressed),
        ),
        body: Center(
          child: Column(
            //TODO: Build serviceButtons with a WidgetBuilder/ListBuilder
            children: <Widget>[
              new ServiceButton(serviceName: 'Netflix'),
              new ServiceButton(serviceName: 'Amazon Prime'),
              new ServiceButton(serviceName: 'Hulu'),
              new ServiceButton(serviceName: 'Disney Plus'),
              new ServiceButton(serviceName: 'Crave'),
              new ServiceButton(serviceName: 'HBO'),
            ]
          )
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.check),
            onPressed: () => checkButtonPressed(services)),
      ),
    );
  }
}