import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Market.dart';

import 'EditCell.dart';

final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C'];

class EditView extends StatefulWidget {
  @override
  EditViewState createState() {
    return EditViewState();
  }
}



class EditViewState extends State<EditView> {
  List<Market> markets = Cache.markets;

  EditViewState(){
     this.init_data();
  }

  init_data(){
    HttpUtil.post("all_market/",{}, (dynamic data){
       print("data = ${data["post_data"]}");
       List<Market> t_markets = [];
       for(dynamic _market in data["markets"]){
           Market market = Market.fromJson(_market);
           t_markets.add(market);
           print("market name = ${market.name}");
       }
       Cache.markets = t_markets;
       this.setState(() {
            this.markets = t_markets;
       });
    });
  }

  Widget build(BuildContext context) {
    EditCellInterface add_count = new EditCellInterface();
    add_count.left_icon = Icon(Icons.account_box,size: 32);
    add_count.left_title = "添加账号";

    EditCellInterface about_cell = new EditCellInterface();
    about_cell.left_icon = Icon(Icons.app_settings_alt,size: 32);
    about_cell.left_title = "关于";

    var view = Scaffold(
        body: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
                EditCell(add_count),
                Divider(height: 2),
                EditCell(about_cell)
            ],
            )
          );

    return view;
  }
}
