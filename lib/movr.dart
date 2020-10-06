import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/pages/GroupSelectionPage.dart';
import 'package:flutter/services.dart';

//Local Imports
import 'pages/MovrHomePage.dart';
import 'pages/SelectGenresPage.dart';
import 'pages/SelectServicesPage.dart';
import 'pages/DisplayFilmPage.dart';

void main() => runApp(Movr());

class Movr extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    //Uncomment to remove Android Status Bar
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      routes: {
        '/': (context) => MovrHomePage(),
        //'/SelectGenres': (context) => SelectGenresPage(),
        '/SelectServices': (context) => SelectServicesPage(),
        '/GroupSizeSelection': (context) => GroupSelectionPage(),
        '/DisplayFilms': (context) => DisplayFilmPage(),
      },
      title: 'Movr: Tinder for Movies',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    ) ;
  }
}

