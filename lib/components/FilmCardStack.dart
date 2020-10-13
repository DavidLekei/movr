import 'package:flutter/material.dart';
import 'package:movr/data/FilmInfo.dart';

import 'DraggableFilmCard.dart';

class FilmCardStack extends StatefulWidget {
  List<DraggableFilmCard> draggableCardList;

  FilmCardStack({Key key, this.draggableCardList}) : super(key: key);

  _FilmCardStackState createState() => _FilmCardStackState();

}
class _FilmCardStackState extends State<FilmCardStack>{


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: this.widget.draggableCardList,
    );
  }


}