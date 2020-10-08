import 'package:flutter/material.dart';
import 'package:movr/components/DraggableFilmCard.dart';
import 'package:movr/components/EndOfList.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/components/FilmCardStack.dart';
import 'package:movr/data/FilmInfo.dart';
import 'package:movr/pages/DisplayMatchesPage.dart';

class DisplayFilmPage extends StatefulWidget{

  DisplayFilmPage({Key key}) : super(key: key);

  _DisplayFilmPageState createState() => _DisplayFilmPageState();

}

class _DisplayFilmPageState extends State<DisplayFilmPage> {

  List<FilmInfo> filmInfoList;
  List<FilmCard> filmCardList = List();
  List<DraggableFilmCard> draggableFilmCardList;

  @override
  void initState() {
    filmInfoList = createTestFilmInfoList();
    createFilmCardList();
    draggableFilmCardList = createDraggableFilmCardList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(draggableFilmCardList.length > 0) {
      return FilmCardStack(draggableCardList: draggableFilmCardList);
    }
    else{
      return EndOfList();
    }
  }

  List<FilmInfo> getFilmInfoList() {
    List<FilmInfo> filmInfoList;

    filmInfoList = createTestFilmInfoList();

    return filmInfoList;
  }

  List<FilmInfo> createTestFilmInfoList() {
    List<FilmInfo> filmInfoList = List(20);

    for (int i = 0; i < 20; i++) {
      filmInfoList[i] = (FilmInfo('TestFilm$i', 'Just a Test #$i',
          Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover),
          6.5));
    }
    return filmInfoList;
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayMatchesPage()));
    }
  }

  List<DraggableFilmCard> createDraggableFilmCardList(){
    List<DraggableFilmCard> dFilmCards = List<DraggableFilmCard>();
    List<FilmCard> filmCardList = this.filmCardList;

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
    for(int i = 0; i < this.filmInfoList.length; i++){
      var filmInfo = this.filmInfoList[i];
      this.filmCardList.add(
          FilmCard(
            filmInfo: filmInfo,
          )
      );
    }
  }
}