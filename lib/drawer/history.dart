import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steppers/bannerads.dart';


class Histori extends StatefulWidget {
  const Histori({Key? key}) : super(key: key);

  @override
  _HistoriState createState() => _HistoriState();
}

class _HistoriState extends State<Histori> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Color(0xFF641549),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Important",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      content: Text(
                        "Only Running or Walking session is considered for leaderboard.Session performed using any tye of vehicle is exluded from leaderboard",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      actions: [
                        FlatButton(
                          child: Text("OK",
                            style: TextStyle(color:Color(0xFf4A0737),fontWeight: FontWeight.w700,letterSpacing: 1),),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  },
                );
              },
                child: SvgPicture.asset('assets/ic_info.svg')),
          ),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:SingleChildScrollView (
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/ic_app_icon.svg'),
                  SvgPicture.asset('assets/ic_arrow_days.svg'),
                  SvgPicture.asset('assets/ic_arrow_right.svg'),
                  SvgPicture.asset('assets/ic_check_circle.svg'),
                  SvgPicture.asset('assets/ic_close.svg'),
                  SvgPicture.asset('assets/ic_color_fill.svg'),
                  SvgPicture.asset('assets/ic_delete.svg'),
                  SvgPicture.asset('assets/ic_female.svg'),
                 // SvgPicture.asset('assets/ic_info.svg'),
                  SvgPicture.asset('assets/ic_launcher_foreground.svg',color: CupertinoColors.black ,),
                  SvgPicture.asset('assets/ic_lock.svg'),
                  SvgPicture.asset('assets/ic_male.svg'),
                  SvgPicture.asset('assets/ic_media.svg'),
                  SvgPicture.asset('assets/ic_navigate.svg'),
                  SvgPicture.asset('assets/ic_note_general.svg'),
                  SvgPicture.asset('assets/ic_note_payment_failed.svg'),
                  SvgPicture.asset('assets/ic_note_payment_pending.svg'),
                  SvgPicture.asset('assets/ic_note_payment_success.svg'),
                  SvgPicture.asset('assets/ic_note_referral.svg'),
                  SvgPicture.asset('assets/ic_note_reward.svg'),
                  SvgPicture.asset('assets/ic_notification.svg'),
                  SvgPicture.asset('assets/ic_op_calories.svg'),
                  SvgPicture.asset('assets/ic_op_distance.svg'),
                  SvgPicture.asset('assets/ic_op_duration.svg'),
                  SvgPicture.asset('assets/ic_op_referral.svg'),
                  SvgPicture.asset('assets/ic_paypal.svg'),
                  SvgPicture.asset('assets/ic_ra_01.svg'),
                  SvgPicture.asset('assets/ic_ra_02.svg'),
                  SvgPicture.asset('assets/ic_ra_03.svg'),
                  SvgPicture.asset('assets/ic_ra_04.svg'),
                  SvgPicture.asset('assets/ic_ra_05.svg'),
                  SvgPicture.asset('assets/ic_ra_06.svg'),
                  SvgPicture.asset('assets/ic_ra_07.svg'),
                  SvgPicture.asset('assets/ic_ra_08.svg'),
                  SvgPicture.asset('assets/ic_ra_09.svg'),
                  SvgPicture.asset('assets/ic_radio_button_checked.svg'),
                  SvgPicture.asset('assets/ic_radio_button_unchecked.svg'),
                  SvgPicture.asset('assets/ic_rb_distance_leader.svg'),
                  SvgPicture.asset('assets/ic_rb_refer_leader.svg'),
                  SvgPicture.asset('assets/ic_referrer.svg'),
                  SvgPicture.asset('assets/ic_server_image.svg'),
                  SvgPicture.asset('assets/ic_share.svg'),
                  SvgPicture.asset('assets/ic_speedometer.svg'),
                  SvgPicture.asset('assets/ic_star.svg'),
                  SvgPicture.asset('assets/ic_target.svg'),
                  SvgPicture.asset('assets/ic_timer.svg'),
                  SvgPicture.asset('assets/ic_up.svg'),
                  SvgPicture.asset('assets/ic_warning.svg'),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Stack(
                children: [
                 Banners(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}