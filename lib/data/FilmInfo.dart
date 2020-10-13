import 'package:flutter/material.dart';

class FilmInfo{
  final String filmName;
  final String filmDesc;
  final Image poster;
  final double rating;

  FilmInfo(this.filmName, this.filmDesc, this.poster, this.rating);

  static FilmInfo fromList(List list){
    return new FilmInfo(list[1], list[3], Image.asset('assets/images/test_poster2.jpg'), 6.3);
  }

  getFilmName(){
    return this.filmName;
  }
  getFilmDesc(){
    return this.filmDesc;
  }
  getPoster(){
    return this.poster;
  }
  getRating(){
    return this.rating;
  }

  void sprint(){
    print('$filmName');
    print(' - $filmDesc');
  }
}