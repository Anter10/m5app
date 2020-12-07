import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class PersonWidget extends StatelessWidget {
  PersonWidget({Key key}) : super(key: key);

  List<String> items = <String>["绑定微信", "绑定银行卡"];
  deal_data(dynamic data){
    print("data ${jsonEncode(data)}");
  }
  @override
  Widget build(BuildContext context) {
    HttpUtil.post("market_profit_and_volume_information/",{"symbol":"USDJPY"},this.deal_data);
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255,52,90,128),
          iconTheme: IconThemeData(color: Color.fromARGB(255,255,255,255)),
          title: const Text('个人', style: TextStyle(color: Colors.white)),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ));
  }
}

class PersonViewState extends State<PersonView> {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return PersonWidget();
  }
}

/// This Widget is the main application widget.
class PersonView extends StatefulWidget {
  @override
  PersonViewState createState() => PersonViewState();
}
