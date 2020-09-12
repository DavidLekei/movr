import 'package:flutter/material.dart';

//Local Imports
import 'pages/MovrHomePage.dart';
import 'pages/SelectGenresPage.dart';

void main() => runApp(Movr());

class Movr extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      routes: {
        '/': (context) => MovrHomePage(),
        '/SelectGenres': (context) => SelectGenresPage(),
      },
      title: 'Movr: Tinder for Movies',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ) ;
  }
}

