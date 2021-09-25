import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steppers/bannerads.dart';

import 'flexibleappbar.dart';


class Leaderboard extends StatefulWidget {
  const Leaderboard({Key? key}) : super(key: key);

  @override
  _LeaderboardState createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 180.0,
            backgroundColor: Color(0xFF641549),
            title: Text("Laderboard"),
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
            actions: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: GestureDetector(
                   onTap: (){
                     showDialog(
                       context: context,
                       builder: (BuildContext context) {
                         AlertDialog dialog = AlertDialog(
                           title: Text(
                             "Weekly Leaderboard",
                             style:
                             TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                           ),
                           content: Text(
                             "This leaderboard will reset weekly on time shown on screen.PERFORMER panel is list of users with maximum distance coverd by running or walking during current week.",
                             style: TextStyle(color: Colors.grey, fontSize: 15),
                           ),
                           actions: [
                             FlatButton(
                               child: Text("OK",
                                   style: TextStyle(
                                       color: Color(0xFf4A0737),
                                       fontWeight: FontWeight.bold)),
                               onPressed: () {
                                 Navigator.of(context).pop();
                               },
                             )
                           ],
                         );
                         return dialog;
                       },
                     );
                   },
                     child: SvgPicture.asset('assets/ic_info.svg')),
               ),

            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),

        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: SingleChildScrollView(
      //         scrollDirection: Axis.vertical,
      //         child: Column(
      //           children: [
      //             Container(
      //               height: 150,
      //               color:Color(0xFF641549),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         Banners(),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}