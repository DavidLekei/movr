import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/data/FilmInfo.dart';

import 'DraggableFilmCard.dart';

class FilmCardStack extends StatelessWidget{
  List<DraggableFilmCard> draggableCardList = List();
  List<FilmCard> filmCardList = List();
  List<FilmInfo> filmInfoList = List();

  FilmCardStack({Key key, this.filmInfoList}) : super(key: key);


  @override
  Widget build(BuildContext context){
    createFilmCardList();
    return Stack(
      children: test(),
    );
//    stack.children.add(
//        DraggableFilmCard(
//          filmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
//          childFilmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
//      )
//    );
//
//    return stack;
//    return Stack(
//      children: [
//        DraggableFilmCard(
//          filmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
//          childFilmCard: FilmCard(filmName: 'Geralds Game', filmDesc: 'Gerald plays a game.', pathToPoster:'assets/images/test_poster2.jpg', rating: 6.6),
//        ),
//      ]
//    );
  }


  List<DraggableFilmCard> test(){
    List<DraggableFilmCard> dFilmCards = List(filmCardList.length);

    dFilmCards[0] = (DraggableFilmCard(filmCard: filmCardList[1], childFilmCard:FilmCard(
      filmName: 'Out of Cards',
      filmDesc: 'No More Swiping',
      rating: 0.0,
      poster: Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover),
    )));

    for(int i = 1; i < filmCardList.length; i++){
      dFilmCards[i] = DraggableFilmCard(filmCard: filmCardList[i], childFilmCard: filmCardList[i-1]);
      print('Added: ');
      print(filmCardList[i].filmName);
    }



    return dFilmCards;
  }

  printFilmCardList(){
    for(int i = 0; i < filmCardList.length; i++){
      print(filmCardList[i].filmName);
    }
  }

  createFilmCardList(){
    for(int i = 0; i < filmInfoList.length; i++){
      var filmInfo = filmInfoList[i];
      filmCardList.add(
          FilmCard(
            filmName: filmInfo.getFilmName(),
            filmDesc: filmInfo.getFilmDesc(),
            poster: filmInfo.getPoster(), //TODO: Change to actual image file from network
            rating: filmInfo.getRating(),
          )
      );
    }
  }
}