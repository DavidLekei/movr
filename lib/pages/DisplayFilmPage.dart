import 'package:flutter/material.dart';
import 'package:movr/components/DraggableFilmCard.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/components/FilmCardStack.dart';
import 'package:movr/data/FilmInfo.dart';

class DisplayFilmPage extends StatelessWidget{

  List<FilmInfo> filmInfoList;

  DisplayFilmPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    filmInfoList = getFilmInfoList();
    return FilmCardStack(filmInfoList);

//    return Stack(
//      children: [
//        DraggableFilmCard(),
//        DraggableFilmCard(),
//      ]
//    );
//    return DraggableFilmCard();
  }

  List<FilmInfo> getFilmInfoList(){
    List<FilmInfo> filmInfoList;

    return filmInfoList;
  }

}