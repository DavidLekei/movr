import 'package:flutter/material.dart';
import 'package:movr/components/MovrAppBar.dart';

class EndOfList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MovrAppBar(),
      body:
        Center(
          child: Column(
            children: [
              Text('No More Movie Cards Left'),
            ]
          )
        )
    );
  }

}