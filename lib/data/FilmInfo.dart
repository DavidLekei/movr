import 'package:flutter/material.dart';

class FilmInfo{
  final String filmName;
  final String filmDesc;
  final String posterID;
  final double rating;

  FilmInfo(this.filmName, this.filmDesc, this.posterID, this.rating);

  static FilmInfo fromList(List list){
    return new FilmInfo(list[1], list[3], list[2], 6.3);
  }

  getFilmName(){
    return this.filmName;
  }
  getFilmDesc(){
    return this.filmDesc;
  }
  getPoster(){
    return this.posterID;
  }
  getRating(){
    return this.rating;
  }

  void sprint(){
    print('$filmName');
    print(' - $filmDesc');
  }
}