import 'package:flutter/material.dart';

class Poster extends StatelessWidget{

  final String imagePath;

  Poster({Key key, this.imagePath,}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.70,
        child: Image.asset(imagePath, fit: BoxFit.cover,),
    );
  }

}