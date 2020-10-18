import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movr/data/FilmInfo.dart';

class ApiClient{
  final baseApiURL = 'http://movr-api-env.eba-6imq5dvi.us-east-2.elasticbeanstalk.com/';
  final basePosterURL = 'https://elasticbeanstalk-us-east-1-860313693320.s3.amazonaws.com/posters/netflix/action/';


  Future<Image> getPosterFromURL(String posterID) async {
    if(posterID[0] == '0'){
      posterID = posterID.substring(1, posterID.length - 1);
    }
    return Image.network(basePosterURL + posterID + '.jpg');
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
      final getMoviesParams = 'getMovies?service=netflix&numFilms=20&genres=action,drama,scifi';
      http.Response response = await client.get(baseApiURL + getMoviesParams);
      if(response.statusCode == 200){
        List<FilmInfo> filmInfoList = parseFilmInfoList(response);
        print('FilmInfoList Created!');
        return filmInfoList;
      }
      else{
        return null;
      }
  }
}