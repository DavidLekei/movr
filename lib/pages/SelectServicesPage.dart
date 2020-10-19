import 'package:flutter/material.dart';
import 'dart:async';

import 'package:movr/pages/SelectGenresPage.dart';
import '../components/ServiceButton.dart';
import 'package:movr/util/ServiceIcons.dart';
import 'package:movr/components/MovrButton.dart';
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
        body: Center(
          child: Column(
            //TODO: Build serviceButtons with a WidgetBuilder/ListBuilder
            children: <Widget>[
              Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/20),
              new ServiceButton(icon: Icon(ServiceIcons.netflix_symbol_pms), label: 'Netflix', ),
              new ServiceButton(label: 'Amazon Prime'),
              new ServiceButton(label: 'Hulu'),
              new ServiceButton(label: 'Disney Plus'),
              new ServiceButton(label: 'Crave'),
              new ServiceButton(label: 'HBO'),
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