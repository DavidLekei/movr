import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';

class DraggableFilmCard extends StatefulWidget{

  FilmCard filmCard;
  FilmCard childFilmCard;

  DraggableFilmCard({Key key, this.filmCard, this.childFilmCard}): super(key: key);

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
      onDragEnd: (dragDetails) => determineSwipe(dragDetails),
      //onDragStarted: getPosition,
      maxSimultaneousDrags: 1,
    );
  }

  determineSwipe(DraggableDetails dragDetails){
    var pos = getPosition(dragDetails);
    if(pos.getX() >= 250.0){
      print('RIGHT SWIPE DETECTED');
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