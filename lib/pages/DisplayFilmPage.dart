import 'package:flutter/material.dart';
import 'package:movr/components/DraggableFilmCard.dart';
import 'package:movr/components/FilmCard.dart';

class DisplayFilmPage extends StatelessWidget{

  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DraggableFilmCard(key: _key);
  }


}