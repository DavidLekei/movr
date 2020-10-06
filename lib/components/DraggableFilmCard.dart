import 'package:flutter/material.dart';
import 'package:movr/components/FilmCard.dart';

class DraggableFilmCard extends StatefulWidget{

  DraggableFilmCard({GlobalKey key}): super(key: key);

  @override
  _DraggableFilmCardState createState() => _DraggableFilmCardState();

}

class _DraggableFilmCardState extends State<DraggableFilmCard>{

  final key = GlobalKey();

  @override
  Widget build(BuildContext context){
    return Draggable(
      key: key,
      child: FilmCard(),
      feedback: FilmCard(),
      onDragEnd: (dragDetails) => getPosition(dragDetails),
      //onDragStarted: getPosition,
      maxSimultaneousDrags: 1,
    );
  }

  getPosition(DraggableDetails dragDetails){
    var x = dragDetails.offset.dx;
    var y = dragDetails.offset.dy;

    print('X = $x || Y = $y');
  }


}