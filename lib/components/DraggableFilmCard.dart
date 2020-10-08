import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';

class DraggableFilmCard extends StatefulWidget{

  FilmCard filmCard;
  FilmCard childFilmCard;
//  List<DraggableFilmCard> draggableFilmCardList;
  Function(DraggableDetails) onDragEnd;

  DraggableFilmCard({Key key, this.filmCard, this.childFilmCard, this.onDragEnd}): super(key: key);

  @override
  _DraggableFilmCardState createState() => _DraggableFilmCardState();

}

class _DraggableFilmCardState extends State<DraggableFilmCard>{

  @override
  Widget build(BuildContext context){
    return Draggable(
      child: this.widget.filmCard,
      childWhenDragging: this.widget.childFilmCard,
      feedback: this.widget.filmCard,
      onDragEnd: (dragDetails) => this.widget.onDragEnd(dragDetails),
      //onDragStarted: getPosition,
      maxSimultaneousDrags: 1,
    );
  }

}

class Position{
  final double x;
  final double y;

  Position(this.x, this.y);

  getX(){
    return this.x;
  }

  getY(){
    return this.y;
  }

}