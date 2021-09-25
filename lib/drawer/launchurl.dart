import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class launchh extends StatelessWidget {
  const launchh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<RemoteConfig>(
        future: setupRemoteConfig(),
        builder: (BuildContext context, AsyncSnapshot<RemoteConfig> snapshot) {
          return snapshot.hasData
              ? launchURL(remoteConfig: snapshot.requireData)
              : Container();
        },
      ),
    );
  }
}

launchURL({required RemoteConfig remoteConfig}) async {
  RemoteConfig remoteConfig = RemoteConfig.instance;
  String  url = 'https://play.google.com/store/search?q=pub:${remoteConfig.getString('wel')}';
   log('${remoteConfig.getString('wel')}');
  _launch(url);

}
_launch(url) async {
  //log(smsPhoneNumber());
  try {
    await launch(url);
  } catch (e) {
    print(e.toString());
  }
}


Future<RemoteConfig> setupRemoteConfig() async{
  await Firebase.initializeApp();
  final RemoteConfig remoteConfig = RemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: Duration(seconds: 1),
    minimumFetchInterval: Duration(seconds: 1),
  ));

  remoteConfig.setDefaults(<String, dynamic>{
    'wel': 'this is the default welcome message',
    'feat1_enabled': true,
  });

  await remoteConfig.fetchAndActivate();
  RemoteConfigValue(null, ValueSource.valueStatic);
  return remoteConfig;
}
