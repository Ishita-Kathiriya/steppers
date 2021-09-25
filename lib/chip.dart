
import 'dart:developer';
import 'package:flutter/material.dart';


class DailyGoal extends StatefulWidget {
  const DailyGoal({Key? key}) : super(key: key);

  @override
  _DailyGoalState createState() => _DailyGoalState();

}

class _DailyGoalState extends State<DailyGoal> {

  double _currentSliderValue = 100;
  int goal =0;
  void callback(int newgoal) {
    setState((){
     newgoal  = _currentSliderValue.toInt();
     goal= newgoal.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionChip(
        label: Text("Daily Goal : " + goal.toString() +" Steps",style: TextStyle(color:Color(0xFFBA6C9E)),),
        backgroundColor: Color(0xFF641549),
        side: BorderSide(color: Color(0xFFBA6C9E), width: 1),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: Text("Daily Step Target",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                    content:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Drag Slider below to adjust your daily steps goal",style: TextStyle(color: Colors.grey,fontSize: 15),),
                        SizedBox(height: 15),
                        Slider(
                          value: _currentSliderValue,
                          min: 100,
                          max: 8500,
                          divisions: 100,
                          activeColor:  Color(0xFf4A0737),
                          inactiveColor: Color(0xFFB17FA0),
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                       // log("on changed"+value.toString());
                            setState(() {
                              _currentSliderValue = value;
                              log(value.toString());
                            });
                          },
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("CANCLE",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("SET",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
                        onPressed: () {
                          log("setchange");
                          setState((){
                          callback(goal);
                              // log(goal.toString());
                          });
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}


