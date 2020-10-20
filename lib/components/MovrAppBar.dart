import 'package:flutter/material.dart';
import 'package:movr/main.dart';

class MovrAppBar extends StatefulWidget implements PreferredSizeWidget{

  MovrAppBar({Key key}): preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  final String MovrAppBarText = "movr";

  @override
  final Size preferredSize;
  @override
  _MovrAppBarState createState() => _MovrAppBarState();

}

class _MovrAppBarState extends State<MovrAppBar>{
  @override
  Widget build(BuildContext context){
    return AppBar(title: Text(this.widget.MovrAppBarText));
  }
}