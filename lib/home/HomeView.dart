import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Market.dart';

final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C'];

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() {
    return HomeViewState();
  }
}



class HomeViewState extends State<HomeView> {
  List<Market> markets = Cache.markets;

  HomeViewState(){
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
        body: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: this.markets.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 2),
            itemBuilder: (BuildContext context, int index) {
              return  MarketInfoCell(this.markets[index]);
            }));

    return view;
  }
}
