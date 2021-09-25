

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steppers/body.dart';
import 'package:steppers/notifications.dart';

import 'drawer.dart';

class Steppers extends StatefulWidget {
  const Steppers({Key? key}) : super(key: key);

  @override
  _SteppersState createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {

  //switch
  bool isSwitched = false;
  var textValue = 'OFF';

  void toggleSwitch(bool value) {
    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'ON';
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'OFF';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF641549),
      appBar: AppBar(
          backgroundColor: Color(0xFF641549),
          title: Text("Stepper"),
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
                child: SvgPicture.asset('assets/ic_bell.svg',color: Colors.white,)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                            title: Text("STEPPER",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            content:Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                    children:[
                                      Icon(Icons.snowshoeing_sharp),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 18),
                                        child: Column(
                                          children: [
                                            Text("Auto Step tracker"),
                                            Column(
                                              children: [
                                                Text('$textValue',style: TextStyle(color:Colors.grey,fontSize: 15),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Transform.scale(
                                        scale: 1,
                                        child: Switch(
                                          onChanged: (value) {
                                            setState((){
                                              return toggleSwitch(value);
                                            });
                                          },
                                          value: isSwitched,
                                          activeColor: Colors.orange,
                                          activeTrackColor: Colors.orange.shade200,
                                        ),
                                      ),
                                    ]
                                ),
                                Column(
                                  children: [
                                    Text("Lightweight pendometer app using the hardwaer step-sensor for minimal battery consumption. This app ios designed to be kept running all the time without having any impact on your battery life! It uses the hardware step detection sensor of the Nexus 5, which is already running even when not using any pendometer app.Therfore the app does not drain any additional battery.Unlike other pedometer aps,this app does not track your movement or your location so it doesn't need to turn on your GPS sensor( again: no impact on your battery )."
                                      ,style: TextStyle(color: Colors.grey,fontSize: 15),textAlign:TextAlign.justify,),
                                  ],
                                )
                              ],
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("CLOSE",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
                  child: SvgPicture.asset('assets/ic_settings_power.svg',color: Colors.white,)),
            ),

          ]),
      drawer: Drawers(),
      body:Body(),
    );
  }
}