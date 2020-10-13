import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movr/data/FilmInfo.dart';

class ApiClient{
  final base_url = 'http://localhost:5000/';


    List<FilmInfo> parseFilmInfoList(http.Response response){
      print("RESPONSE DATA: " );
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
      http.Response response = await client.get(base_url + getMoviesParams);
      if(response.statusCode == 200){
        List<FilmInfo> filmInfoList = parseFilmInfoList(response);
        return filmInfoList;
      }
      else{
        return null;
      }
  }
}