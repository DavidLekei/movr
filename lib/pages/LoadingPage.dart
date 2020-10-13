import 'package:flutter/material.dart';
import 'package:movr/util/ApiClient.dart';
import 'package:http/http.dart' as http;

class LoadingPage extends StatefulWidget{

  LoadingPage({Key key}): super(key: key);

  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>{
//  @override
//  Widget build(BuildContext context){
//    return null;
//  }

  final filmInfoList = ApiClient().getMovies(http.Client());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: filmInfoList,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container (
              color: Colors.white,
                child: Column(
                  children: [
                    Text('FilmInfoRecieved'),
                  ]
                )
            );
          }
          else {
            return CircularProgressIndicator();
          }
        }
    );
  }
}
