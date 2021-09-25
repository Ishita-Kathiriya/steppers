import 'dart:developer';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'drawer/achivements.dart';
import 'drawer/history.dart';
import 'drawer/invite&earn.dart';
import 'drawer/launchurl.dart';
import 'drawer/leaderboard.dart';
import 'drawer/rewards.dart';
import 'drawer/settings.dart';


class Drawers extends StatefulWidget {
  const Drawers({Key? key}) : super(key: key);

  @override
  _DrawersState createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(user!.displayName!),
                accountEmail: Text(
                  user!.email!,
                  style: TextStyle(color: Colors.pink.shade50),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF621647),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoURL!),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Histori()));
                },
                leading: SvgPicture.asset('assets/icons/ic_history.svg'),
                title: Text(
                  "History",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Achivements()));
                },
                leading:SvgPicture.asset('assets/icons/ic_achievements.svg'),
                title: Text(
                  "Achivements",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Leaderboard()));
                },
                leading: SvgPicture.asset('assets/icons/ic_leaderboard.svg'),
                title: Text(
                  "Leaderboard",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> InviteEarn()));
                },
                leading: SvgPicture.asset('assets/ic_invite_earn.svg'),
                title: Text(
                  "invite & Earn",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Reward()));
                },
                leading:   SvgPicture.asset('assets/ic_my_rewards.svg'),
                title: Text(
                  "My Rewards",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  "Other",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
                  },
                  title: Text(
                    "App Settings",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> launchh()));
                  },
                  title: Text(
                    "More Apps",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(
                    "Rate App",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  onTap: () async {
                    log("message");
                    // FirebaseService service = new FirebaseService();
                    // await service.signOutFromGoogle();
                    // Navigator.pushReplacementNamed(
                    //     context, '/SignInPage');
                  },
                  title: Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
