import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DistanceandCalories extends StatefulWidget {
  const DistanceandCalories({Key? key}) : super(key: key);

  @override
  _DistanceandCaloriesState createState() => _DistanceandCaloriesState();
}

class _DistanceandCaloriesState extends State<DistanceandCalories> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFf4A0737),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.house,
                      size: 20,
                      color: Color(0xFF794676),
                    ),
                    Text(
                      "DISTANCE",
                      style: TextStyle(color: Color(0xFF794676)),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        " 0.00",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "km",
                        style:
                        TextStyle(color: Color(0xFFBA6C9E)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 60,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFf4A0737),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15, top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/ic_calorie.svg', color: Color(0xFF794676),height: 19,),
                    Text(
                      "CALORIES",
                      style: TextStyle(color: Color(0xFF794676)),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        " 0.00",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        "kcal",
                        style:
                        TextStyle(color: Color(0xFFBA6C9E)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
