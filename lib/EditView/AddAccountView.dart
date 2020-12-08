import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class AddAccountViewWidget extends StatelessWidget {
  AddAccountViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          backgroundColor: nagivator_bottom_color,
          flexibleSpace: FlexibleSpaceBar(
               
          ),
          title: const Text('添加账号')
        ),
        
      ],
    ));
  }
}

class AddAccountViewState extends State<AddAccountView> {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return AddAccountViewWidget();
  }
}

/// This Widget is the main application widget.
class AddAccountView extends StatefulWidget {
  @override
  AddAccountViewState createState() => AddAccountViewState();
}
