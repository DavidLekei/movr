import 'package:flutter/material.dart';
import 'package:movr/components/CheckboxButton.dart';
import '../components/GenreButton.dart';
import 'DisplayFilmPage.dart';
import 'GroupSelectionPage.dart';

import '../util/UserSelections.dart' as UserSelections;


class SelectGenresPage extends StatefulWidget {
  SelectGenresPage({Key key, this.title}): super(key: key);

  final String title;

  @override
  _SelectGenresPageState createState() => _SelectGenresPageState();
}

class _SelectGenresPageState extends State<SelectGenresPage> {

  List<String> genres = UserSelections.genres;

  void checkButtonPressed(){
    print('Genres Selected: ');
      for(String genre in genres)
        {
          print(genre);
        }
      Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayFilmPage()));
  }

  Future<bool> backPressed() async
  {
    print("Back Pressed");
    UserSelections.genres.clear();
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    for(String service in UserSelections.services)
    {
      print("Service Passed to Genres Page: " + service);
    }
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 20;
    final double itemWidth = size.width / 2;
    return WillPopScope(
      onWillPop: backPressed,
      child: Scaffold(
//          appBar: AppBar(
//            title: Text('Select Genres', style: TextStyle(fontSize: 24)),
//          ),
          body: GridView.count(
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            childAspectRatio: (itemWidth/itemHeight),
            scrollDirection: Axis.vertical,
            //TODO: Create buttons using WidgetBuilder
            children: <Widget>[
              Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/20),
              CheckboxButton(icon: Icon(Icons.directions_run), label: 'Action', selectionsList: UserSelections.genres,),
              CheckboxButton(icon: Icon(Icons.launch), label: 'Comedy', selectionsList: UserSelections.genres,),
              CheckboxButton(icon: Icon(Icons.drafts), label: 'Drama', selectionsList: UserSelections.genres,),
              CheckboxButton(icon: Icon(Icons.warning), label: 'Horror', selectionsList: UserSelections.genres,),
              CheckboxButton(icon: Icon(Icons.favorite), label: 'Romance', selectionsList: UserSelections.genres,),
//              GenreButton(genre: 'Action'),
//              GenreButton(genre: 'Drama'),
//              GenreButton(genre: 'Comedy'),
//              GenreButton(genre: 'Horror'),
//              GenreButton(genre: 'Romance'),
            ]
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.check),
              onPressed: checkButtonPressed)
      ),
    );
  }
}