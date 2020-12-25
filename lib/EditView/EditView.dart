import 'dart:convert';
import 'dart:ffi';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:m5app/EditView/AddAccountView.dart';
import 'package:m5app/EditView/EmailView.dart';
import 'package:m5app/common/Cache.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';
import 'package:m5app/modal/Event.dart';
import 'package:m5app/modal/Market.dart';

import 'AboutView.dart';
import 'EditCell.dart';

class EditView extends StatefulWidget {
  @override
  EditViewState createState() {
    return EditViewState();
  }
}

class EditViewState extends State<EditView> {
  List<Market> markets = Cache.markets;
  int statue1 = 1;
  EditViewState() {
    event_bus.on<String>().listen((event) {
      print("data ${event}");
      setState(() {
        this.statue1 = 2;
        print("data1 ${event}");
      });
    });
  }

  Widget build(BuildContext context) {
    EditCellInterface add_count = new EditCellInterface();
    add_count.left_icon =
        Icon(Icons.account_box, size: 32, color: nagivator_bottom_color);
    add_count.left_title = "登陆账号";
    add_count.call = () {
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return AddAccountView();
        },
      ));
    };

    EditCellInterface about_cell = new EditCellInterface();
    about_cell.left_icon =
        Icon(Icons.app_settings_alt, size: 32, color: nagivator_bottom_color);
    about_cell.left_title = "关于";
    about_cell.call = () {
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return AboutView();
        },
      ));
    };

    EditCellInterface email_cell = new EditCellInterface();
    email_cell.left_icon =
        Icon(Icons.email, size: 32, color: nagivator_bottom_color);
    email_cell.left_title = "邮箱";
    email_cell.call = () {
      Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return EmailView();
        },
      ));
    };

    print("cell1");
    final cell = Cache.user == null ? EditCell(add_count) : Container();
    final divider = Cache.user == null ? Divider(height: 2) : Container();

    var view = Scaffold(
        body: ListView(
      padding: const EdgeInsets.all(0),
      children: <Widget>[
        cell,
        divider,
        EditCell(email_cell),
        Divider(height: 2),
        EditCell(about_cell)
      ],
    ));

    return view;
  }
}
