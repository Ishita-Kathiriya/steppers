import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:steppers/drawer/launchurl.dart';
import 'package:url_launcher/url_launcher.dart';

class InviteEarn extends StatefulWidget {
  const InviteEarn({Key? key}) : super(key: key);

  @override
  _InviteEarnState createState() => _InviteEarnState();
}

class _InviteEarnState extends State<InviteEarn> {
  String? _linkMessage;
  bool _isCreatingLink = false;

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          final Uri? deepLink = dynamicLink?.link;

          if (deepLink != null) {
            // ignore: unawaited_futures
            Navigator.pushNamed(context, deepLink.path);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      // ignore: unawaited_futures
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<String> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://dynamiclinke.page.link',
      link: Uri.parse('https://dynamiclinke.page.link'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.stepper',
        minimumVersion: 0,
      ),
      dynamicLinkParametersOptions: DynamicLinkParametersOptions(
        shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
      ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink = await parameters.buildShortLink();
      url = shortLink.shortUrl;
    } else {
      url = await parameters.buildUrl();
    }

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });
    return url.toString();
  }

  //share link
  Future<void> share() async {
    await FlutterShare.share(
      linkUrl: 'https://stepperapp.page.link/GkcT',
      title: 'Stepper',
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Color(0xFF641549),
        title: Text("Invite & Earn"),
      ),
      body:Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                        children: [
                          Lottie.asset('assets/icons/invite.json',height: 200),
                          Padding(
                            padding: const EdgeInsets.only(left: 28, right: 28),
                            child: Column(
                              children: [
                                Text("Start inviting your friends by sharing your personalized refer link.Beat milestone as "
                                    "shown below and get rewarded on each successful on  referral.",textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 25),
                                child: Container(
                                  height: 38,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child:FutureBuilder<String>(
                                            future: _createDynamicLink(true),
                                          builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                                            if (snapshot.hasData){
                                              if(!_isCreatingLink == _createDynamicLink(true)  ){
                                                Text(
                                                  _linkMessage ?? '',
                                                  style: const TextStyle(color: Colors.blue),
                                                );
                                              }
                                              return Text(_linkMessage ?? '',style: TextStyle(color: Colors.grey),);
                                            }
                                            return Container();
                                          },
                                        )
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: GestureDetector(
                                          onTap: (){
                                            Clipboard.setData(ClipboardData(text: _linkMessage));
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('Copied Link!')),
                                            );
                                          },
                                            child: SvgPicture.asset('assets/ic_copy.svg',height: 20,)
                                        ),
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,bottom: 20),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 0,
                              color: Colors.amber.shade700,
                                onPressed: share,
                              child:Text(
                                  "INVITE  FRIENDS",
                                  style: TextStyle(
                                  letterSpacing: 1, color: Colors.white),
                              ),
                            ),
                          ),
                          // ElevatedButton(
                          //   onPressed: !_isCreatingLink
                          //       ? () => _createDynamicLink(true)
                          //       : null,
                          //   child: const Text('Get Short Link'),
                          // ),
                        ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 300,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
                color: Colors.white,
                height: 50,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                             Navigator.of(context).push(SecondPageRoute());
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_up_outlined,
                              color: Colors.black,
                            )),
                        Text(
                          "  My Referral",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "0",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Oswald',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondPageRoute extends PageRouteBuilder {
  SecondPageRoute()
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> pageAnimation) =>
          SecondPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> pageAnimation) {
    // TODO: implement buildPage
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(0, 1), end: Offset(.0, .0))
          .animate(controller!),
      child: SecondPage(),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Referral',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Text(
                "0",
                style: TextStyle(fontFamily: 'Oswald', color: Colors.black,fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(":("),
            SizedBox(height: 8,),
            Text("You haven't completed any referral"),
          ],
        ),
      ),
    );
  }
}