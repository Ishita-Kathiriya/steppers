import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bannerads.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        backgroundColor: Color(0xFF641549),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [

              ],
            ),
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