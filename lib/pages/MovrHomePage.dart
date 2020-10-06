import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movr'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            new FloatingActionButton.extended(label: Text('Movies'), backgroundColor: Colors.blue, onPressed: moviesButtonPressed, heroTag: 'moviesbtn'),
            new FloatingActionButton.extended(label: Text('TV'), backgroundColor: Colors.green, onPressed: null, heroTag: 'tvbtn'),
            new FloatingActionButton.extended(label: Text('Debug'), backgroundColor: Colors.red, onPressed: debugButtonPressed, heroTag: 'debugbtn'),
          ]
        )
      )
    );
  }

}