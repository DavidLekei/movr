import 'package:flutter/material.dart';

import '../util/UserSelections.dart' as UserSelections;

class ServiceButton extends StatefulWidget{
  final String serviceName;
  final bool selected = false;

  ServiceButton({Key key, this.serviceName}): super(key: key);

  @override
  _ServiceButtonState createState() => _ServiceButtonState();
}

class _ServiceButtonState extends State<ServiceButton>{

  bool selected = false;
  List<String> services = UserSelections.services;

  void select(List<String> services)
  {
    //print("Service Selected: " + this.widget.serviceName);
    setState(() {
      if(selected){
        services.remove(this.widget.serviceName);
        selected = false;
      }
      else{
        services.add(this.widget.serviceName);
        selected = true;
      }
    });
  }


  @override
  Widget build(BuildContext context){
    Color color;
    if(this.selected){
      color = Colors.green;
    }
    else{
      color = Colors.red[600];
    }
    return new RaisedButton(
      child: Text(this.widget.serviceName),
      color: color,
      onPressed: () => select(services),
    );
  }
}