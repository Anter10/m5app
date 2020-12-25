import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:m5app/EditView/AddAccountView.dart';
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

  ProfitViewState() {
    if (Cache.user != null) {
      this.init_data();
    }
    event_bus.on<String>().listen((event) {
      setState(() {
        print("data1 ${event}");
      });
    });
  }

  init_data() {
    HttpUtil.post("ventures/", {"tel_phone": Cache.user.tel_phone},
        (dynamic data) {
      print("ventures = ${data}");
      List<Venture> t_ventures = [];
      List<Market> venture_markets = [];

      for (dynamic _venture in data["ventures"]) {
        Venture venture = Venture.fromJson(_venture);
        t_ventures.add(venture);
      }

      for (dynamic _market in data["markets"]) {
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
    Widget t_view = null;
    if (Cache.user != null) {
      // t_view = ListView(children: <Widget>[
      //   Container(
      //     height: 240,
      //   ),
      //   Container(height: 40),
      //   ListView.builder(
      //       padding: const EdgeInsets.all(0),
      //       itemCount: this.t_ventures.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return ProfitViewCell(
      //             this.t_ventures[index], this.venture_markets[index]);
      //       }),
      // ]);
      t_view = CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.blue[200 + 1 % 4 * 100],
                  height: 160 + 1 % 4 * 20.0,
                  child: Text('Item: ${11}'),
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ProfitViewCell(
                    this.t_ventures[index], this.venture_markets[index]);
              },
              childCount: this.t_ventures.length,
            ),
          ),
        ],
      );

      // t_view = Container(child: Text("Hello"));
    } else {
      Container t1_view = Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return EdgeInsets.all(10);
                } else {
                  return EdgeInsets.all(10);
                }
              }),
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return TextStyle(fontSize: 18);
                } else {
                  return TextStyle(fontSize: 18);
                }
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return nagivator_bottom_color;
                }
                return nagivator_bottom_color;
              }),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return AddAccountView();
                },
              ));
            },
            child: Text('登陆账号'),
          ));
      t_view = Scaffold(
          body: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [t1_view],
              )));
    }

    return t_view;
  }
}
