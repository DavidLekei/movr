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
    filmInfoList = createTestFilmInfoList();
    return FilmCardStack(filmInfoList: filmInfoList);

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

    filmInfoList = createTestFilmInfoList();

    return filmInfoList;
  }

  List<FilmInfo> createTestFilmInfoList(){
    List<FilmInfo> filmInfoList = List(20);

    for(int i = 0; i < 20; i++) {
      filmInfoList[i] = (FilmInfo('TestFilm$i', 'Just a Test #$i', Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover), 6.5));
    }
    return filmInfoList;
  }

}