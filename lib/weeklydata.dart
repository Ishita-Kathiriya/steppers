import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info/device_info.dart';
import 'package:pedometer/pedometer.dart';

import 'dart:async';
import 'dart:io';
class WeeklyData extends StatefulWidget {
  const WeeklyData({Key? key}) : super(key: key);

  @override
  _WeeklyDataState createState() => _WeeklyDataState();
}

class _WeeklyDataState extends State<WeeklyData> {

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 140,
      child: ListView.builder(
          itemCount: 7,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return Container(
              width: MediaQuery.of(context).size.width/7,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFF4A0737),
                          ),
                        ),
                        Container(
                          //alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Color(0xFFBA6C9E),
                          ),
                          height: 100*1500/10000,
                        ),
                      ],
                    ),
                  ),
                  Text("Data",style: TextStyle(color: Colors.white),),
                ],
              ),
            );
          }
      ),
    );
  }
}
