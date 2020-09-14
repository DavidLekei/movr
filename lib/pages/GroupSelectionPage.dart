import 'package:flutter/material.dart';

import '../util/UserSelections.dart' as UserSelections;

class GroupSelectionPage extends StatefulWidget{
  GroupSelectionPage({Key key}): super(key: key);

  final List<String> services = UserSelections.services;
  final List<String> genres = UserSelections.genres;

  @override
  _GroupSelectionPageState createState() => _GroupSelectionPageState();
}

class _GroupSelectionPageState extends State<GroupSelectionPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('movr')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(child: Text('Solo')),
            new RaisedButton(child: Text('Group')),
          ]
        )
      ),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: null),
    );
    //TODO: Build scaffold.
    return null;
  }
}