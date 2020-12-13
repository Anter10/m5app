import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/modal/Market.dart';
import 'package:search_app_bar/filter.dart';
import 'package:search_app_bar/search_app_bar.dart';

import 'MarketInfoItem.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
final SnackBar snackBar = const SnackBar(content: Text('Showing Snackbar'));
 

class MarketInfoViewState extends State<MarketInfoView> {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    MarketInfoItemInterface item1_interface = new MarketInfoItemInterface();
    item1_interface.left_title = "点";
    item1_interface.right_title = "${this.widget.market.digits}";

    MarketInfoItemInterface item2_interface = new MarketInfoItemInterface();
    item2_interface.left_title = "合约数量";
    item2_interface.right_title = "${this.widget.market.trade_contract_size}";

    MarketInfoItemInterface item3_interface = new MarketInfoItemInterface();
    item3_interface.left_title = "最小量";
    item3_interface.right_title = "${this.widget.market.volume_min}";


    MarketInfoItemInterface item4_interface = new MarketInfoItemInterface();
    item4_interface.left_title = "最大量";
    item4_interface.right_title = "${this.widget.market.volume_max}";


    MarketInfoItemInterface item5_interface = new MarketInfoItemInterface();
    item5_interface.left_title = "步长";
    item5_interface.right_title = "${this.widget.market.volume_step}";

    MarketInfoItemInterface item6_interface = new MarketInfoItemInterface();
    item6_interface.left_title = "买入库存费";
    item6_interface.right_title = "${this.widget.market.swap_long}";

    MarketInfoItemInterface item7_interface = new MarketInfoItemInterface();
    item7_interface.left_title = "卖出库存费";
    item7_interface.right_title = "${this.widget.market.swap_short}";

    MarketInfoItemInterface item8_interface = new MarketInfoItemInterface();
    item8_interface.left_title = "库存费类型";
    item8_interface.right_title = "${this.widget.market.swap_mode}";
    


    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 52, 90, 128),
            title: Text(
              "详情",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        body: ListView(
            children: [
              MarketInfoItem(item1_interface),
              Divider(height: 1,),
              MarketInfoItem(item2_interface),
              Divider(height: 1,),
              MarketInfoItem(item3_interface),
              Divider(height: 1,),
              MarketInfoItem(item4_interface),
              Divider(height: 1,),
              MarketInfoItem(item5_interface),
              Divider(height: 1,),
              MarketInfoItem(item6_interface),
              Divider(height: 1,),
              MarketInfoItem(item7_interface),
              Divider(height: 1,),
              MarketInfoItem(item8_interface),
            ],
        ));;
  }
}

/// This Widget is the main application widget.
class MarketInfoView extends StatefulWidget {
  Market market;

  MarketInfoView(Market market) {
    this.market = market;
  }

  @override
  MarketInfoViewState createState() => MarketInfoViewState();
}
