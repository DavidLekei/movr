import 'package:flutter/material.dart';
import 'package:movr/pages/SelectGenresPage.dart';
import '../components/ServiceButton.dart';

class SelectServicesPage extends StatefulWidget{

  @override
  _SelectServicesPageState createState() => _SelectServicesPageState();
}

class _SelectServicesPageState extends State<SelectServicesPage>{

  List<String> services = new List();

  void checkButtonPressed(List<String> services)
  {
//    Navigator.pushNamed(context, '/SelectGenres');
      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectGenresPage(services: services)));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Select the Services you have'),
      ),
      body: Center(
        child: Column(
          //TODO: Build serviceButtons with a WidgetBuilder/ListBuilder
          children: <Widget>[
            new ServiceButton(services: services, serviceName: 'Netflix'),
            new ServiceButton(services: services, serviceName: 'Amazon Prime'),
            new ServiceButton(services: services, serviceName: 'Hulu'),
            new ServiceButton(services: services, serviceName: 'Disney Plus'),
            new ServiceButton(services: services, serviceName: 'Crave'),
            new ServiceButton(services: services, serviceName: 'HBO'),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () => checkButtonPressed(services)),
    );
  }
}