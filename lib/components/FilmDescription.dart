import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilmDescription extends StatelessWidget{

  final String filmName;
  final String filmDesc;
  final double rating;

  FilmDescription({Key key, this.filmName, this.filmDesc, this.rating}): super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: implement build

    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Text(filmName, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold), softWrap: true),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(filmDesc, style: TextStyle(color: Colors.grey), softWrap: true),
                  )
                  //Text(filmDesc, style: TextStyle(color: Colors.grey,)),
                ]
              )
            ),
            Container(
              child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow,),
                    Text('$rating')
                ]
              ),
            )
          ]
        )
      ),
    );
  }

}