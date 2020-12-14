import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Market.dart';
import 'package:m5app/modal/Venture.dart';
import 'package:m5app/modal/VentureOrder.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';
 

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
 

class VentureHistoryDetailState extends State<VentureHistoryDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 52, 90, 128),
            title: Text(
              "投资历史",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: ListView(
            children: [
           
            ],
        ));;
  }
}

/// This Widget is the main application widget.
class VentureHistoryDetail extends StatefulWidget {
  Venture vender_order;

  VentureHistoryDetail(Venture vender_order) {
    this.vender_order = vender_order;
  }

  @override
  VentureHistoryDetailState createState() => VentureHistoryDetailState();
}
