import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movr/data/FilmInfo.dart';

class ApiClient{
  final baseApiURL = 'http://movr-api-env.eba-6imq5dvi.us-east-2.elasticbeanstalk.com/';
  final basePosterURL = 'https://elasticbeanstalk-us-east-1-860313693320.s3.amazonaws.com/movr/imdb_top_100/';


  Future<Image> getPosterFromURL(String posterID) async {
    if(posterID[0] == '0'){
      posterID = posterID.substring(1, posterID.length - 1);
    } //, loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress){ return Center(child: child); }
    Image image = new Image.network(basePosterURL + posterID + '.jpg', fit: BoxFit.fill);
    image.image.resolve(new ImageConfiguration()).addListener(new ImageStreamListener((info, call){
      print('Image: ' + posterID + ' has finished loading.');
    }));
    return image;
  }

    List<FilmInfo> parseFilmInfoList(http.Response response){
      print("RESPONSE DATA: " );
      //print(response.body);
      Map<String, dynamic> filmsJson = jsonDecode(response.body);
      List<FilmInfo> filmInfoList = List();
      for (var val in filmsJson.values){
          filmInfoList.add(FilmInfo.fromList(val));
      }
      return filmInfoList;
    }

    Future<List<FilmInfo>> getMovies(http.Client client) async {
      print("Sending HTTP Request");
//      final getMoviesParams = 'getMovies?service=netflix&numFilms=20&genres=action,drama,scifi';
      final params = 'getTop100';
      http.Response response = await client.get(baseApiURL + params);
      if(response.statusCode == 200){
        List<FilmInfo> filmInfoList = parseFilmInfoList(response);
        return filmInfoList;
      }
      else{
        return null;
      }
  }
}