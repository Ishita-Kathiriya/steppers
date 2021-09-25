import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyFlexiableAppBar extends StatelessWidget {


  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight ,
      child: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(child: new Text(
                          "THIS LEADERBOARD WILL RESET WEEKLY",
                          style: const TextStyle(
                              color: Color(0xFFBB6c8E),
                              fontFamily: 'Poppins',
                              fontSize: 12.0
                          )
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(child: new Text(
                            "NEXT RESET IN",
                            style: const TextStyle(
                               color: Color(0xFFBA6C9E),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w800,
                                fontSize: 12.0
                            )
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: RaisedButton(
                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: Colors.amber.shade700,
                          onPressed: (){},
                         child: Text("20 Sep 12:30 PM",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],),),
              ),
            ],)
      ),
      decoration: new BoxDecoration(
        color: Color(0xFF641549),
      ),
    );
  }
}