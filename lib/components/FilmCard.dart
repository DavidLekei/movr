import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movr/components/FilmDescription.dart';
import 'package:movr/components/MovrAppBar.dart';
import 'package:movr/components/Poster.dart';

import '../util/UserSelections.dart' as UserSelections;

class FilmCard extends StatefulWidget{
  FilmCard({Key key}): super(key: key);

  final List<String> services = UserSelections.services;
  final List<String> genres = UserSelections.genres;

  @override
  _FilmCardState createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Poster(imagePath: 'assets/images/test_poster2.jpg'),
            FilmDescription(filmName: 'Gerald\'s Game', filmDesc: 'A woman accidentally kills her husband during a kinky game. Handcuffed to her bed with no hope of rescue, she begins hearing voices and seeing strange visions.'),
          ]
        ),
      );
//    return Scaffold(
//        body: Container(
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
//            child: Column(
//                children: [
//                  Poster(imagePath: 'assets/images/test_poster2.jpg'),
//                  FilmDescription(filmName: 'Gerald\'s Game', filmDesc: 'A woman accidentally kills her husband during a kinky game. Handcuffed to her bed with no hope of rescue, she begins hearing voices and seeing strange visions.'),
//                ]
//            )
//        ),

//      body: Draggable(
//        child: Container(
//          child: Column(
//            children: [
//              Poster(imagePath: 'assets/images/test_poster2.jpg'),
//              FilmDescription(filmName: 'Gerald\'s Game', filmDesc: 'A woman accidentally kills her husband during a kinky game. Handcuffed to her bed with no hope of rescue, she begins hearing voices and seeing strange visions.'),
//            ]
//          )
//        ),
//        feedback: Container(
//          child: Column(
//            children: [
//              Poster(imagePath: 'assets/images/test_poster2.jpg'),
//              FilmDescription(filmName: 'Gerald\'s Game', filmDesc: 'A woman accidentally kills her husband during a kinky game. Handcuffed to her bed with no hope of rescue, she begins hearing voices and seeing strange visions.'),
//            ]
//          )
//        )
//    )
//    );
  }

}