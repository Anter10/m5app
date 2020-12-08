import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Market.dart';



class ProfitView extends StatefulWidget {
  @override
  ProfitViewState createState() {
    return ProfitViewState();
  }
}



class ProfitViewState extends State<ProfitView> {
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
    
    var view = Scaffold(
        body: ListView(
            padding: const EdgeInsets.all(0),
            children: <Widget>[
                Text("Hello profit view")
            ],
            )
          );

    return view;
  }
}
