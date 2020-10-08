import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/data/FilmInfo.dart';
import 'package:movr/pages/MovrHomePage.dart';

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
    super.initState();
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
      rightSwipe();
    }
    else if(pos.getX() <= -250.0){
      print('LEFT SWIPE DETECTED');
      leftSwipe();
    }
    else{
      print('IGNORING SWIPE');
    }
  }

  rightSwipe(){
    setState(() {
      print("SETTING STATE");
      removeDraggableCard();
    });
  }

  leftSwipe(){
    setState(() {
      print("SETTING STATE");
      removeDraggableCard();
    });
  }

  getPosition(DraggableDetails dragDetails){
    var pos = Position(dragDetails.offset.dx, dragDetails.offset.dy);
    return pos;
  }

  removeDraggableCard(){

      draggableFilmCardList.removeLast();
      if(draggableFilmCardList.length == 0){
          print('List is now Empty. Return to main menu');
          Navigator.push(context, MaterialPageRoute(builder: (context) => MovrHomePage()));
      }
  }

  List<DraggableFilmCard> createDraggableFilmCardList(){
    List<DraggableFilmCard> dFilmCards = List<DraggableFilmCard>();
    List<FilmCard> filmCardList = this.widget.filmCardList;

    dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[1], childFilmCard:FilmCard(filmInfo: FilmInfo(
      'Out of Cards',
      'No More Swiping',
      Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover),
      0.0,)
     ),
     onDragEnd: determineSwipe, )
    );

    for(int i = 1; i < filmCardList.length; i++){
      dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[i], childFilmCard: filmCardList[i-1], onDragEnd: determineSwipe));
    }

    return dFilmCards;
  }



  printFilmCardList(List<FilmCard> filmCardList){
    for(int i = 0; i < filmCardList.length; i++){
      print(filmCardList[i].filmInfo.filmName);
    }
  }

  createFilmCardList(){
    for(int i = 0; i < this.widget.filmInfoList.length; i++){
      var filmInfo = this.widget.filmInfoList[i];
      this.widget.filmCardList.add(
          FilmCard(
            filmInfo: filmInfo,
          )
      );
    }
  }
}