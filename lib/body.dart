import 'package:flutter/material.dart';
import 'package:steppers/chip.dart';
import 'package:steppers/session.dart';
import 'package:steppers/sleekslider.dart';
import 'package:steppers/weeklydata.dart';
import 'bannerads.dart';
import 'distance&calories.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: DailyGoal(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DistanceandCalories(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SleekSlider(),
              ),
              Column(
                children: [
                  Session(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 35),
                child: Row(
                  children: [
                    Text(
                      "LAST 7 DAYS",
                      style:
                      TextStyle(color: Color(0xFFB17FA0), fontSize: 13),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child:WeeklyData(),
              )
            ],
          ),
        ),
        Column(
          children: [
            Banners(),
          ],
        ),
      ],
    );
  }
}
