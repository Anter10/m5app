import 'dart:convert';

import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:m5app/EditView/AddAccountView.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/modal/Market.dart';

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  Widget buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            title,
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title,
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}

class VentureViewState extends State<VentureView> {
  final _formKey = GlobalKey<FormState>();

  VentureViewState() {
    event_bus.on<String>().listen((event) {
      setState(() {
        print("data1 ${event}");
      });
    });
  }
  int selectedIndex1 = 0;
  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
              title: "${val}",
            ))
        .toList();
  }

  final elements1 = [
    500,
    1000,
    5000,
    10000,
    100000,
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (Cache.user == null) {
      children = [
        Container(
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
        ))
      ];
    } else {
      children = [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 30.0),
          child: Text(
            "当前余额还剩: ${Cache.user.balance}元",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ),
        DirectSelect(
            itemExtent: 35.0,
            selectedIndex: selectedIndex1,
            backgroundColor: nagivator_bottom_color,
            child: MySelectionItem(
              isForList: false,
              title: "${elements1[selectedIndex1]}元",
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedIndex1 = index;
              });
            },
            mode: DirectSelectMode.tap,
            items: _buildItems1()),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
          child: Text(
            "请点击后,上下滑动选择你想要投资金额",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 40),
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
                var login_data = {
                  "market_id": this.widget.market.id,
                  "money": this.elements1[this.selectedIndex1],
                  "tel_phone": Cache.user.tel_phone,
                };

                HttpUtil.post("venture/", login_data, (dynamic data) {
                  print("登陆数据回调 = ${data}");
                });
              },
              child: Text('确定投资'),
            ))
      ];
    }
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 52, 90, 128),
            title: Text(
              "投资:${this.widget.market.name}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: children,
            )));
    ;
  }
}

/// This Widget is the main application widget.
class VentureView extends StatefulWidget {
  Market market;

  VentureView(Market market) {
    this.market = market;
  }
  @override
  VentureViewState createState() => VentureViewState();
}
