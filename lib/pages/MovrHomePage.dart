import 'package:flutter/material.dart';

class MovrHomePage extends StatefulWidget {

  @override
  _MovrHomePageState createState() => _MovrHomePageState();

}

class _MovrHomePageState extends State<MovrHomePage>
{

  void moviesButtonPressed()
  {
    Navigator.pushNamed(context, '/SelectGenres');
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
          ]
        )
      )
    );
  }

}