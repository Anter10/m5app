import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Market.dart';
import 'package:m5app/modal/Venture.dart';
import 'package:m5app/venture/ProfitViewCell.dart';



class ProfitView extends StatefulWidget {
  @override
  ProfitViewState createState() {
    return ProfitViewState();
  }
}


class ProfitViewState extends State<ProfitView> {
  List<Venture> t_ventures = Cache.t_ventures;
       List<Market> venture_markets = Cache.venture_markets;

  ProfitViewState(){
     this.init_data();
  }

  init_data(){
    HttpUtil.post("ventures/",{"tel_phone":tel_test_phone}, (dynamic data){
       print("ventures = ${data}");
       List<Venture> t_ventures = [];
       List<Market> venture_markets = [];

       for(dynamic _venture in data["ventures"]){
           Venture venture = Venture.fromJson(_venture);
           t_ventures.add(venture);
       }

       for(dynamic _market in data["markets"]){
           Market market = Market.fromJson(_market);
           venture_markets.add(market);
       }

       Cache.venture_markets = venture_markets;
       Cache.t_ventures = t_ventures;

       this.setState(() {
            this.t_ventures = t_ventures;
            this.venture_markets = venture_markets;
       });
    });
  }

  Widget build(BuildContext context) {
   var view = Scaffold(
        body: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: this.t_ventures.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 2),
            itemBuilder: (BuildContext context, int index) {
              return  ProfitViewCell(this.t_ventures[index],this.venture_markets[index]);
            }));

    return view;
  }
}
