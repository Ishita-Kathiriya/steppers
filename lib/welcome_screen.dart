import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:steppers/sign_in.dart';
import 'home_page.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  _SpalshState createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {

  User? result = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>{
          result != null ?
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context) =>Steppers())):
          Navigator.push(context,MaterialPageRoute(builder:(context) =>SignInPage()))
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/splash.jpg',fit: BoxFit.cover,),
          ),
          Padding(
            padding: const EdgeInsets.only(top:540,left:100),
            child: Column(
              children: [
                Container(
                  child:SvgPicture.asset('assets/ic_icon.svg',height: 90,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45),
                  child: Text("Stepper",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,letterSpacing: 1),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Text("The Pedometer App",style: TextStyle(color: Colors.white54,fontSize: 20),),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}


