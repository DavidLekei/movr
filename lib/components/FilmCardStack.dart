import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/data/FilmInfo.dart';

import 'DraggableFilmCard.dart';

class FilmCardStack extends StatefulWidget {
  List<DraggableFilmCard> draggableCardList = List();
  List<FilmCard> filmCardList = List();
  List<FilmInfo> filmInfoList = List();

  FilmCardStack({Key key, this.filmInfoList}) : super(key: key);

  _FilmCardStackState createState() => _FilmCardStackState();

}
class _FilmCardStackState extends State<FilmCardStack>{

  List<DraggableFilmCard> draggableFilmCardList;

  @override
  void initState() {
    // TODO: implement initState
    createFilmCardList();
    draggableFilmCardList = createDraggableFilmCardList();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: draggableFilmCardList,
    );
  }

  determineSwipe(DraggableDetails dragDetails){
    var pos = getPosition(dragDetails);
    if(pos.getX() >= 250.0){
      print('RIGHT SWIPE DETECTED FROM CALLBACK??');
      setState(() {
        print("SETTING STATE");
        removeDraggableCard();
      });
    }
    else if(pos.getX() <= -250.0){
      print('LEFT SWIPE DETECTED');
    }
    else{
      print('IGNORING SWIPE');
    }
  }

  getPosition(DraggableDetails dragDetails){
    var pos = Position(dragDetails.offset.dx, dragDetails.offset.dy);
    return pos;
  }

  removeDraggableCard(){
      print("Attempting to remove card...");
      print(draggableFilmCardList.length);
      draggableFilmCardList.removeLast();
      print("After remove...");
      print(draggableFilmCardList.length);
  }

  List<DraggableFilmCard> createDraggableFilmCardList(){
    List<DraggableFilmCard> dFilmCards = List<DraggableFilmCard>();
    List<FilmCard> filmCardList = this.widget.filmCardList;

    dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[1], childFilmCard:FilmCard(
      filmName: 'Out of Cards',
      filmDesc: 'No More Swiping',
      rating: 0.0,
      poster: Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover),
    )));

    for(int i = 1; i < filmCardList.length; i++){
      dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[i], childFilmCard: filmCardList[i-1], onDragEnd: determineSwipe));
    }

    return dFilmCards;
  }



  printFilmCardList(List<FilmCard> filmCardList){
    for(int i = 0; i < filmCardList.length; i++){
      print(filmCardList[i].filmName);
    }
  }

  createFilmCardList(){
    for(int i = 0; i < this.widget.filmInfoList.length; i++){
      var filmInfo = this.widget.filmInfoList[i];
      this.widget.filmCardList.add(
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