import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/data/FilmInfo.dart';

import 'DraggableFilmCard.dart';

class FilmCardStack extends StatelessWidget{
  List<FilmCard> filmCardList;
  List<FilmInfo> filmInfoList;

  FilmCardStack(List<FilmInfo> filmInfoList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        DraggableFilmCard(
          filmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
          childFilmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
        ),
      ]
    );
  }

  createStack(){
    for(int i = 0; i < filmInfoList.length; i++){
      var filmInfo = filmInfoList[i];
      filmCardList.add(FilmCard(

      ));
    }
  }
}