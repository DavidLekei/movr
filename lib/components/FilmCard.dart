import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movr/components/FilmDescription.dart';
import 'package:movr/components/MovrAppBar.dart';
import 'package:movr/components/Poster.dart';
import 'package:movr/data/FilmInfo.dart';
import 'package:movr/util/ApiClient.dart';

import '../util/UserSelections.dart' as UserSelections;

class FilmCard extends StatefulWidget{

  final FilmInfo filmInfo;
  bool loaded = false;

//  final String filmName;
//  final String filmDesc;
//  final Image poster;
//  final double rating;

  FilmCard({Key key, this.filmInfo}): super(key: key);

  final List<String> services = UserSelections.services;
  final List<String> genres = UserSelections.genres;

  @override
  _FilmCardState createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {

  Future<Image> getPoster(){
    ApiClient apiClient = ApiClient();
    Future<Image> poster = apiClient.getPosterFromURL(this.widget.filmInfo.posterID);
    return poster;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            FutureBuilder(
              future: getPoster(),
              builder: (context, snapshot) {
                this.widget.loaded = true;
                return Poster(image: snapshot.data);
              }
            ),
            FilmDescription(filmName: this.widget.filmInfo.filmName, filmDesc: this.widget.filmInfo.filmDesc, rating: this.widget.filmInfo.rating),
          ]
        ),
      );
  }

}