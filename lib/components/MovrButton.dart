import 'package:flutter/material.dart';

class MovrButton extends StatelessWidget{

  final Icon icon;
  final String label;
  final String route;

  const MovrButton({Key key, this.icon, this.label, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context){
      var _height = MediaQuery.of(context).size.height / 10;
      return Container(
        padding: EdgeInsets.only(top: 40.0),
      child:  SizedBox(
        height: _height,
        child:
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(1.0, 2.0),
                    blurRadius: 6.0,
                    spreadRadius: 2.0,
                  )
                ]
            ),

            child: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 48.0,
                      height: _height,
                      padding: EdgeInsets.only(left: 40.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: icon,
                      )
                    ),
                    Expanded(
                      child: Center(
                        child: Text(label)
                      )
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        width: 48.0,
                        height: _height,
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.arrow_forward),
                        )
                    ),
                  ]
                ),
                SizedBox.expand(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(onTap: (){
                      Navigator.pushNamed(context, route);
                    } ,)
                  )
                )
              ]
            )

          )
      )
    );
  }
}