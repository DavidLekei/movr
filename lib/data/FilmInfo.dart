import 'package:flutter/material.dart';

class FilmInfo{
  final String filmName;
  final String filmDesc;
  final Image poster;
  final double rating;

  FilmInfo(this.filmName, this.filmDesc, this.poster, this.rating);

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
}