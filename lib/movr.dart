import 'package:flutter/material.dart';
import 'package:movr/pages/GroupSelectionPage.dart';

//Local Imports
import 'pages/MovrHomePage.dart';
import 'pages/SelectGenresPage.dart';
import 'pages/SelectServicesPage.dart';

void main() => runApp(Movr());

class Movr extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      routes: {
        '/': (context) => MovrHomePage(),
        //'/SelectGenres': (context) => SelectGenresPage(),
        '/SelectServices': (context) => SelectServicesPage(),
        '/GroupSizeSelection': (context) => GroupSelectionPage(),
      },
      title: 'Movr: Tinder for Movies',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ) ;
  }
}

