import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:steppers/bannerads.dart';


class Achivements extends StatefulWidget {
  const Achivements({Key? key}) : super(key: key);

  @override
  _AchivementsState createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achivements"),
        backgroundColor: Color(0xFF641549),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 20,left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_milestone.svg'),
                        Text(
                          "  Distance", style: TextStyle(fontWeight: FontWeight
                            .w600),),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 55,
                          color: Colors.grey.shade200,
                          child: Center(child: Text("0.00km",style: TextStyle(fontFamily: 'Oswald'), textAlign: TextAlign.center,)),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                          // ListView.builder(
                          //  itemCount: 2,
                          //  scrollDirection: Axis.horizontal,
                          //  itemBuilder: (BuildContext context, int index) {
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_01.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_02.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child:    SvgPicture.asset('assets/ic_da_03.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_04.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_05.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_06.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_07.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_08.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_09.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_da_10.svg'),
                        ),
                       //     }
                       // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:LinearPercentIndicator(
                            width: 140.0,
                            lineHeight: 12.0,
                            //percent: 0.5,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.purple.shade200,
                            progressColor: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black,),
                   Padding(
                     padding: const EdgeInsets.only(top: 15,right: 20,left: 20),
                     child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_stopwatch.svg',height: 25,),
                        Text(
                          "  Duration", style: TextStyle(fontWeight: FontWeight
                            .w600),),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 55,
                          color: Colors.grey.shade200,
                          child: Center(child: Text("00:00:00",style: TextStyle(fontFamily: 'Oswald'), textAlign: TextAlign.center,)),
                        )
                      ],
                  ),
                   ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ListView.builder(
                        //  itemCount: 2,
                        //  scrollDirection: Axis.horizontal,
                        //  itemBuilder: (BuildContext context, int index) {
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                          child:  SvgPicture.asset('assets/ic_dda_01.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_02.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child:  SvgPicture.asset('assets/ic_dda_03.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_04.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_05.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_06.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_07.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_08.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_09.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_dda_10.svg'),
                        ),

                        //     }
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:LinearPercentIndicator(
                            width: 140.0,
                            lineHeight: 12.0,
                            // percent: 0.5,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Colors.purple.shade200,
                            progressColor: Colors.purple,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black,),
                  SizedBox(height: 200,),
                  Divider(color: Colors.black,),
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 20,left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/ic_calorie.svg'),
                        Text(
                          "  Calories", style: TextStyle(fontWeight: FontWeight
                            .w600),),
                        Spacer(),
                        Container(
                          height: 25,
                          width: 55,
                          color: Colors.grey.shade200,
                          child: Center(child: Text("0.0kcal",style: TextStyle(fontFamily: 'Oswald'), textAlign: TextAlign.center,)),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ListView.builder(
                        //  itemCount: 2,
                        //  scrollDirection: Axis.horizontal,
                        //  itemBuilder: (BuildContext context, int index) {
                        Padding(
                          padding: const EdgeInsets.only(top: 20,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_01.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_02.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child:  SvgPicture.asset('assets/ic_ca_03.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_04.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_05.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_06.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_07.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_08.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_09.svg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8,left: 15,right: 15),
                          child: SvgPicture.asset('assets/ic_ca_10.svg'),
                        ),

                        //     }
                        // )
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child:LinearPercentIndicator(
                  //           width: 60.0,
                  //           lineHeight: 12.0,
                  //           //percent: 0.5,
                  //           linearStrokeCap: LinearStrokeCap.roundAll,
                  //           backgroundColor: Colors.purple.shade200,
                  //           progressColor: Colors.purple,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Banners()
            ],
          )
        ],
      ),
    );
  }

}
class MyPolygon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height * 1/3),
      Offset(size.width / 2, 0),
      Offset(size.width, size.height * 1/3),
      Offset(size.width * 4/5, size.height),
      Offset(size.width * 1/5, size.height),
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
class MyPolygone extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      Offset(0, size.height / 2),
      Offset(size.width * 1 / 3, size.height),
      Offset(size.height * 2 / 3, size.height),
      Offset(size.width, size.height / 2),
      Offset(size.width * 2 / 3, 0),
      Offset(size.width * 1/3, 0)
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}