import 'package:flutter/material.dart';
import 'package:movr/components/MovrButton.dart';

class MovrHomePage extends StatefulWidget {

  @override
  _MovrHomePageState createState() => _MovrHomePageState();

}

class _MovrHomePageState extends State<MovrHomePage>
{

  void moviesButtonPressed()
  {
    Navigator.pushNamed(context, '/SelectServices');
  }

  void debugButtonPressed(){
    Navigator.pushNamed(context, '/DisplayFilms');
    //Navigator.pushNamed(context, '/LoadingPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('movr'),
//      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height/20),
            new MovrButton(icon: Icon(Icons.local_movies), label:'Movies', route: '/SelectServices'),
            new MovrButton(icon: Icon(Icons.tv), label:'TV', route: '/SelectServices'),
            new MovrButton(icon: Icon(Icons.bug_report), label:'Debug', route: '/DisplayFilms'),

//            new FloatingActionButton.extended(label: Text('Movies'), backgroundColor: Colors.blue, onPressed: moviesButtonPressed, heroTag: 'moviesbtn'),
//            new FloatingActionButton.extended(label: Text('TV'), backgroundColor: Colors.green, onPressed: null, heroTag: 'tvbtn'),
//            new FloatingActionButton.extended(label: Text('Debug'), backgroundColor: Colors.red, onPressed: debugButtonPressed, heroTag: 'debugbtn'),
          ]
        )
      )
    );
  }

}