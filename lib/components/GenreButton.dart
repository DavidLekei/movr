import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../util/UserSelections.dart' as UserSelections;

class GenreButton extends StatefulWidget {

  final String genre;

  GenreButton({Key key, this.genre}): super(key: key);

  @override
  _GenreButtonState createState() => _GenreButtonState();
}

class _GenreButtonState extends State<GenreButton> {

  bool selected = false;
  List<String> genres = UserSelections.genres;

  void select(){
    setState(() {
      if(selected){
        genres.remove(this.widget.genre);
        selected = false;
      }
      else{
        genres.add(this.widget.genre);
        selected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    Color color;
    if(selected)
    {
      color = Colors.green;
    }
    else {
      color = Colors.red[600];
    }
    return new GestureDetector(
        onTap: () => select(),
        child: new Container(
          padding:EdgeInsets.all(4),
          child: Center(
            child: Text(this.widget.genre, style: TextStyle(fontSize: 30)),
          ),
          color: color,
        )
    );
  }

  bool isSelected()
  {
    return selected;
  }

}