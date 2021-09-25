import 'package:flutter/material.dart';

import '../bannerads.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF641549),
        title: Text("Transactions"),
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
