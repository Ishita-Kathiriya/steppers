import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:steppers/bannerads.dart';
import 'package:steppers/home_page.dart';





class RecordSession extends StatefulWidget {
  const RecordSession({Key? key}) : super(key: key);

  @override
  _RecordSessionState createState() => _RecordSessionState();
}

class _RecordSessionState extends State<RecordSession> {

  static const platform = const MethodChannel('example_service');
  String _serverState = 'Did not make the call yet';

  Future<void> _startService() async {
    try {
      final result = await platform.invokeMethod('startExampleService');
      setState(() {
        _serverState = result;
      });
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  Future<void> _stopService() async {
    try {
      final result = await platform.invokeMethod('stopExampleService');
      setState(() {
        _serverState = result;
      });
    } on PlatformException catch (e) {
      print("Failed to invoke method: '${e.message}'.");
    }
  }

  //timer
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;

  Timer? timer;

  @override
  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  bool _canShowButton = true;

  @override
  void hideBtn(){
    setState(() {
      _canShowButton = false;
    });
  }

  bool _canlockButton = true;

  @override
  void lock(){
    if(isActive){
      _canlockButton = false;
    }
  }
  @override
  void dispose() {
    super.dispose();
  }


  Widget slider = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      customColors: CustomSliderColors(
        trackColor: Color(0xFF4A0737),
        dotColor: Colors.amber.shade700,
        progressBarColor: Colors.amber.shade700,
        hideShadow: true,
      ),
      customWidths: CustomSliderWidths(trackWidth:8,progressBarWidth: 8),

      infoProperties: InfoProperties(

          bottomLabelText: 'STEPS',
          bottomLabelStyle: TextStyle(
            color: Color(0xFFB17FA0), fontSize: 13,),

          mainLabelStyle:TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          modifier: (double value) {
            final kcal = value.toInt();
            return '$kcal';
          }
      ),
      size: 200,
      startAngle:140,
      angleRange: 260,
    ),
    min: 0,
    max: 1000,
    initialValue:20 ,
  );


  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);
    return Scaffold(
      backgroundColor: Color(0xFF641549),
      body:SafeArea(
        child: Column(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                      Banners(),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color:Color(0xFF4A0737),
                          ),
                          height: 60,
                          width: 160,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("SESSION TARGET",style: TextStyle(color:  Color(0xFF794676)),),
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("10000",style: TextStyle(color: Colors.white,fontSize:20),),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              double _currentSliderValue = 500;
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return AlertDialog(
                                                    title: Text("Session Target",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                                                    content:Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text("Drag Slider below to adjust your daily steps goal for this session",style: TextStyle(color: Colors.grey,fontSize: 15),),
                                                        SizedBox(height: 15),
                                                        Slider(
                                                          value: _currentSliderValue,
                                                          min: 0,
                                                          max: 16900,
                                                          divisions: 20,
                                                          activeColor:  Color(0xFf4A0737),
                                                          inactiveColor: Color(0xFFB17FA0),
                                                          label: _currentSliderValue.round().toString(),
                                                          onChanged: (double value) {
                                                            setState(() {
                                                              _currentSliderValue = value;
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
                                                          Navigator.of(context).pop();
                                                        },
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                          child: SvgPicture.asset('assets/ic_arrow_drop_down.svg',color: Colors.white,)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color:Color(0xFF4A0737),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15,top: 10,bottom: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("ACTUAL STEPS",style: TextStyle(color: Color(0xFF794676)),)
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text("0",style: TextStyle(color: Colors.white,fontSize:20),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 60,
                          width: 160,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Container(
                    child: Center(
                      child: slider,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        child:  Column(
                          children: [
                            SvgPicture.asset('assets/ic_milestone.svg'),
                            Text("0.00",style: TextStyle(color: Colors.white),),
                            Text("KM",style: TextStyle(color:Color(0xFFB17FA0)),)
                          ],
                        ),
                      ),
                      Container(
                        child:  Column(
                          children: [
                            SvgPicture.asset('assets/ic_stopwatch.svg',height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(hours.toString() +":".padLeft(2,'0'),style: TextStyle(color: Colors.white),),
                                Text(minutes.toString() +":".padLeft(2,'0'),style: TextStyle(color: Colors.white),),
                                Text(seconds.toString().padLeft(2,'0'),style: TextStyle(color: Colors.white),)

                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child:  Column(
                          children: [
                            SvgPicture.asset('assets/ic_calorie.svg'),
                            Text("0.0",style: TextStyle(color: Colors.white),),
                            Text("KCAL",style: TextStyle(color:Color(0xFFB17FA0)),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
               Spacer(),
                Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                       topLeft:Radius.circular(18.0),
                     topRight: Radius.circular(18.0)
                   ),
                   color: Colors.white,
                 ),
                 height: 120,
                 child: !_canShowButton? Container( child: Row(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 40),
                       child: RaisedButton(
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(36)),
                           color:  Color(0xFF641549),
                           textColor: Colors.white,
                           onPressed: () {
                             setState(() {
                               isActive = !isActive;
                             });
                           },
                           child: Row(
                             children: [
                               SvgPicture.asset(isActive ? 'assets/ic_pause.svg': 'assets/ic_play.svg',color: Colors.white,),
                               SizedBox(
                                 width: 10,
                               ),
                               Text(isActive ? 'PAUSE' : 'RESUME'),
                             ],
                           ),
                       ),
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     Container(
                       height: 52,
                       width: 52,
                       child: !_canlockButton ? RaisedButton(
                            shape: CircleBorder(),
                            color: Colors.amber.shade700,
                            onLongPress: () {
                            setState(() {

                            });
                            },
                            onPressed: () {
                            setState((){
                            });
                            },
                             child:  SvgPicture.asset( 'assets/ic_lock.svg',color: Colors.white,),
                        ): RaisedButton(
                         shape: CircleBorder(),
                         color: Colors.amber.shade700,
                         onPressed: () {
                          setState((){
                            lock();
                          });
                         },
                         child:  SvgPicture.asset( 'assets/ic_lock_open.svg',color: Colors.white,),
                       ),
                     ),
                     SizedBox(
                       width: 15,
                     ),
                     RaisedButton(
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(36)),
                         color:  Color(0xFF641549),
                         textColor: Colors.white,
                         onPressed: () {
                           showDialog(
                             context: context,
                             builder: (context) {
                               return StatefulBuilder(
                                 builder: (context, setState) {
                                   return AlertDialog(
                                     title: Text("NO or Low Movement Detected",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                                  content: Text("Continue training or discard this record?"),
                                     actions: <Widget>[
                                       FlatButton(
                                         child: Text("DISCARD",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
                                         onPressed: () {
                                           _stopService();
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=> Steppers()));
                                         },
                                       ),
                                       FlatButton(
                                         child: Text("RESUME",style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
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
                         child: Row(
                           children: [
                             SvgPicture.asset('assets/ic_stop.svg',color: Colors.white,),
                             SizedBox(
                               width: 10,
                             ),
                             Text("STOP"),
                           ],
                         )),
                   ],
                 ),) : Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: 330,
                             height: 40,
                             child: RaisedButton(
                               elevation: 0,
                                color: Colors.amber.shade700,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                               onPressed: (){
                                hideBtn();
                                _startService();
                                 setState(() {
                                   isActive = !isActive;
                                 });
                               },
                               child: Text("TAP HERE TO START",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1),),
                             ),
                           ),
                         ],
                       ),
                     ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(child: Text("Before start recording your session you can change default session target.",style: TextStyle(
                            color: Colors.grey,
                          ),),
                          )
                        ],
                      ),
                    )
                   ],
                 ),
               ),
              ],
        ),
      )
    );
  }


}

