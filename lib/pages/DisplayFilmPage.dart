import 'package:flutter/material.dart';
import 'package:movr/components/DraggableFilmCard.dart';
import 'package:movr/components/EndOfList.dart';
import 'package:movr/components/FilmCard.dart';
import 'package:movr/components/FilmCardStack.dart';
import 'package:movr/data/FilmInfo.dart';
import 'package:movr/pages/DisplayMatchesPage.dart';
import 'package:http/http.dart' as http;
import 'package:movr/util/ApiClient.dart';
import 'package:movr/util/Settings.dart';


class DisplayFilmPage extends StatefulWidget{

  DisplayFilmPage({Key key}) : super(key: key);

  _DisplayFilmPageState createState() => _DisplayFilmPageState();

}

class _DisplayFilmPageState extends State<DisplayFilmPage> {

  List<DraggableFilmCard> draggableFilmCardList;

  Future<List<FilmInfo>> getFilmListFromApi() async {
    ApiClient api = ApiClient();
    return api.getMovies(http.Client());
  }

Future<List<DraggableFilmCard>> createFilmCardStack() async {
    List<FilmInfo> filmInfoList = await getFilmListFromApi();
    List<FilmCard> filmCardList = createFilmCardList(filmInfoList);
    List<DraggableFilmCard> draggableFilmCardList = createDraggableFilmCardList(filmCardList);
    draggableFilmCardList = draggableFilmCardList.reversed.toList();
    return draggableFilmCardList;
}


  @override
  Widget build(BuildContext context) {
    if(draggableFilmCardList != null){

      if(draggableFilmCardList.length > 0) {
        return FilmCardStack(draggableCardList: draggableFilmCardList);
      }
      else{
        return EndOfList();
      }
    }
    else {
      return FutureBuilder(
          future: createFilmCardStack(),
          builder: (context, snapshot) {
            if (snapshot.hasData == true && snapshot.connectionState == ConnectionState.done) {
              draggableFilmCardList = snapshot.data;
              if (draggableFilmCardList == null) {
                print("list is null");
              }
              if(draggableFilmCardList[0].filmCard.loaded == true){
                return Scaffold(
                    body: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Building List...'),
                            CircularProgressIndicator(),
                          ]
                      ),
                    )
                );
              }


              if (draggableFilmCardList.length == Settings.maxFilms){
                return FilmCardStack(draggableCardList: draggableFilmCardList);
              }
              else {
                return EndOfList();
              }
            }
            else {
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Building List...'),
                      CircularProgressIndicator(),
                    ]
                  ),
                )
              );
            }
          }
      );
    }
    // TODO: implement build
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
      //TODO: Add to chosen films list
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

  List<DraggableFilmCard> createDraggableFilmCardList(List<FilmCard> filmCardList){
    List<DraggableFilmCard> dFilmCards = List<DraggableFilmCard>();

    for(int i = 0; i < filmCardList.length - 1; i++){
      dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[i], childFilmCard: filmCardList[i+1], onDragEnd: determineSwipe));
    }

    dFilmCards.add(DraggableFilmCard(filmCard: filmCardList[filmCardList.length - 1], childFilmCard:FilmCard(filmInfo: FilmInfo(
      'Out of Cards',
      'No More Swiping',
      'out_of_cards',//Image.asset('assets/images/test_poster2.jpg', fit: BoxFit.cover),
      0.0,)
    ),
      onDragEnd: determineSwipe, )
    );

    return dFilmCards;
  }

  List<FilmCard> createFilmCardList(List<FilmInfo> filmInfoList){
    List<FilmCard> filmCardList = List();

    for(int i = 0; i < filmInfoList.length; i++) {
      var filmInfo = filmInfoList[i];
      filmCardList.add(
          FilmCard(
            filmInfo: filmInfo,
          )
      );
    }
    return filmCardList;
  }
}