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

  ProfitViewState(){
     this.init_data();
  }

  init_data(){
    HttpUtil.post("ventures/",{"tel_phone":tel_test_phone}, (dynamic data){
       print("ventures = ${data}");
       List<Venture> t_ventures = [];
       for(dynamic _market in data["ventures"]){
           Venture venture = Venture.fromJson(_market);
           t_ventures.add(venture);
       }
       Cache.t_ventures = t_ventures;
       this.setState(() {
            this.t_ventures = t_ventures;
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
              return  ProfitViewCell(this.t_ventures[index]);
            }));

    return view;
  }
}
