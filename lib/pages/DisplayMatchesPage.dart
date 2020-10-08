import 'package:flutter/material.dart';
import 'package:movr/components/MovrAppBar.dart';

class DisplayMatchesPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: MovrAppBar(),
      body:
        Column(
          children: [
            Text('Matches Will Be Displayed Here'),
          ]
        )
    );
  }
}