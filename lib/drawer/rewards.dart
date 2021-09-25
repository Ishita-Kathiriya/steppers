import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:steppers/bannerads.dart';
import 'package:steppers/drawer/transactions.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF641549),
        title: Text("My Rewards"),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Transactions()));
            },
              child: SvgPicture.asset('assets/ic_txn.svg',color: Colors.white,)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    AlertDialog dialog = AlertDialog(
                      title: Text(
                        "How it works",
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      content: Text(
                        "You can withdraw your rewards to your PayPal account once you reach minimum threshold of 10.Once you make withdraw request,your payment is processed within 24 hours.Currently only INFLUENCER Rewards is available. Many more will be available soon.",
                        textAlign: TextAlign.justify,style: TextStyle(color: Colors.grey, fontSize: 15,),
                      ),
                      actions: [
                        FlatButton(
                          child: Text("OK",
                              style: TextStyle(
                                  color: Color(0xFf4A0737),
                                  fontWeight: FontWeight.bold,letterSpacing: 1)),
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
      body: Column(
        children: [
          Expanded(
            child: Column(),
          ),
          Column(
            children: [
              Banners(),
            ],
          )
        ],
      ),
    );
  }
}
