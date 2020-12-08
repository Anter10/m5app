import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));

/// This is the stateless widget that the main application instantiates.
class AboutViewWidget extends StatelessWidget {
  AboutViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          backgroundColor: nagivator_bottom_color,
          flexibleSpace: FlexibleSpaceBar(
               
          ),
          title: const Text('关于')
        ),
        
      ],
    ));
  }
}

class AboutViewState extends State<AboutView> {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return AboutViewWidget();
  }
}

/// This Widget is the main application widget.
class AboutView extends StatefulWidget {
  @override
  AboutViewState createState() => AboutViewState();
}
