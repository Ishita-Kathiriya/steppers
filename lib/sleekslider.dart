import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:device_info/device_info.dart';
import 'package:pedometer/pedometer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'dart:async';
import 'dart:io';


class SleekSlider extends StatefulWidget {
  const SleekSlider({Key? key}) : super(key: key);

  @override
  _SleekSliderState createState() => _SleekSliderState();
}

class _SleekSliderState extends State<SleekSlider> {
  late Stream<StepCount> _stepCountStream;
  String  _steps = '?';
  double currentvalue=0;
   //late SleekCircularSlider slider;


  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print('=====> $event');

    setState(() {
      log("set");
      _steps = event.steps.toString();
      log("set2");
      currentvalue= double.tryParse(event.toString())!;
      log(event.steps.toString());
      log("set3");
    });
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() => _steps = 'Step Count not available');
  }

  Future<Permission> getMotionPermission() async {
    if (Platform.isAndroid && await getAndroidSdk() >= 29) {
      log("Activity Permission");
      return Permission.activityRecognition;
    }else {
      log("Sensor Permission");
      return Permission.sensors;
    }
  }

  Future<int> getAndroidSdk() async {
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var sdkInt = androidInfo.version.sdkInt;
      return sdkInt;
    }
    return 0;
  }

  Future<void> initPlatformState() async {

    Permission motionPermission = await getMotionPermission();
    if (!await motionPermission.isGranted) {
      var newStatus = await motionPermission.request();
      if (!newStatus.isGranted) return Future.error('Permission not granted');
    }

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Center(
            child: SleekCircularSlider(
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
              max: 200000,
              initialValue:currentvalue ,
            ),
          ),
        ),
        Text(_steps,style: TextStyle(fontSize: 30),),
      ],
    );
  }
}