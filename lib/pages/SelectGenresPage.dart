import 'package:flutter/material.dart';
import '../components/GenreButton.dart';


class SelectGenresPage extends StatefulWidget {
  SelectGenresPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _SelectGenresPageState createState() => _SelectGenresPageState();
}

class _SelectGenresPageState extends State<SelectGenresPage> {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 20;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: Text('Select Genres', style: TextStyle(fontSize: 24)),
        ),
        body: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          childAspectRatio: (itemWidth/itemHeight),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GenreButton(genre: 'Action'),
            GenreButton(genre: 'Drama'),
            GenreButton(genre: 'Comedy'),
            GenreButton(genre: 'Horror'),
            GenreButton(genre: 'Romance'),
          ]
        )
    );
  }
}