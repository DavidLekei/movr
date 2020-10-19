import 'package:flutter/material.dart';

import '../util/UserSelections.dart' as UserSelections;

class CheckboxButton extends StatefulWidget{
  final bool selected = false;

  Icon icon = Icon(Icons.announcement);
  final String label;
  final List selectionsList;

  CheckboxButton({Key key, this.icon, this.label, this.selectionsList}): super(key: key);

  @override
  _CheckboxButtonState createState() => _CheckboxButtonState();
}

class _CheckboxButtonState extends State<CheckboxButton>{

  bool selected = false;
  List<String> services = UserSelections.services;

  void select(bool value)
  {
    //print("Service Selected: " + this.widget.serviceName);
    setState(() {
      if(selected){
        //services.remove(this.widget.label);
        this.widget.selectionsList.remove(this.widget.label);
        this.selected = false;
      }
      else{
        //services.add(this.widget.label);
        this.widget.selectionsList.add(this.widget.label);
        this.selected = true;
      }
    });
  }

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
                                  child: this.widget.icon,
                                )
                            ),
                            Expanded(
                                child: Center(
                                    child: Text(this.widget.label)
                                )
                            ),
                            Container(
                                alignment: Alignment.centerRight,
                                width: 48.0,
                                height: _height,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Checkbox(onChanged: (bool value) => select(value), value: selected,),
                                )
                            ),
                          ]
                      ),
                      SizedBox.expand(
                          child: Material(
                              type: MaterialType.transparency,
                              child: InkWell(onTap: (){
                                select(!selected);
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