import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movr/components/FilmDescription.dart';
import 'package:movr/components/MovrAppBar.dart';
import 'package:movr/components/Poster.dart';

import '../util/UserSelections.dart' as UserSelections;

class FilmCard extends StatefulWidget{

  final String filmName;
  final String filmDesc;
  final Image poster;
  final double rating;

  FilmCard({Key key, this.filmName, this.filmDesc, this.poster, this.rating}): super(key: key);

  final List<String> services = UserSelections.services;
  final List<String> genres = UserSelections.genres;

  @override
  _FilmCardState createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Poster(image: this.widget.poster),
            FilmDescription(filmName: this.widget.filmName, filmDesc: this.widget.filmDesc, rating: this.widget.rating),
          ]
        ),
      );
  }

}