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
  deal_data(dynamic data) {
    print("data ${jsonEncode(data)}");
  }

  @override
  Widget build(BuildContext context) {
    HttpUtil.post("market_profit_and_volume_information/", {"symbol": "USDJPY"},
        this.deal_data);
    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          backgroundColor: nagivator_bottom_color,

          flexibleSpace: FlexibleSpaceBar(
                
          ),
          title: const Text('个人信息')
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
