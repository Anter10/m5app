import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/MarketInfoCell.dart';

final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100,600, 500, 100];

class HomeView extends StatefulWidget {
  @override
  HomeViewState createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {

  void init_data(){
       HttpUtil.post("url", body, callback)
  }

  @override
  Widget build(BuildContext context) {
    print("Hello build");
    var view = Scaffold(
        body: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: entries.length,
            separatorBuilder: (BuildContext context, int index) => const Divider(height: 2),
            itemBuilder: (BuildContext context, int index) {
              return  MarketInfoCell();
            }));

    return view;
  }
}
