import 'package:flutter/material.dart';

class Poster extends StatelessWidget{

  final Image image;

  Poster({Key key, this.image,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.70,
        child: image,
    );
  }

}