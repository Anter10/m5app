import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/HistoryDetail.dart';
import 'package:m5app/home/MarketInfoView.dart';
import 'package:m5app/home/VentureView.dart';
import 'package:m5app/modal/Market.dart';
import 'package:m5app/modal/Venture.dart';
import 'package:m5app/venture/ProfitDetailView.dart';
import 'package:m5app/venture/VentureHistoryDetail.dart';

class ProfitViewCell extends StatefulWidget {
  Venture venture;
  Market market;
  ProfitViewCell(Venture venture, Market market) {
    this.venture = venture;
    this.market = market;
  }

  @override
  ProfitViewCellState createState() {
    return ProfitViewCellState();
  }
}

class ProfitViewCellState extends State<ProfitViewCell> {
  bool selected = false;

  showCupertinoActionSheet(Venture venture, Market market) async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('${market.name}'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  '投资历史',
                  style: TextStyle(
                      color: nagivator_bottom_color,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return VentureHistoryDetail(this.widget.venture);
                    },
                  ));
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  '收益详情',
                  style: TextStyle(
                      color: nagivator_bottom_color,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return ProfitDetailView(this.widget.venture);
                    },
                  ));
                },
                isDestructiveAction: false,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child:
                  Text('取消', style: TextStyle(color: nagivator_bottom_color)),
              onPressed: () {
                Navigator.of(context).pop('cancel');
              },
              isDefaultAction: true,
            ),
          );
        });
    print('$result');
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector Cell = GestureDetector(
      onTapDown: (e) {
        setState(() {
          this.selected = !this.selected;
        });
      },
      onTapUp: (e) {
        setState(() {
          this.selected = !this.selected;
          this.showCupertinoActionSheet(
              this.widget.venture, this.widget.market);
        });
      },
      onTapCancel: () {
        setState(() {
          this.selected = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color:
              this.selected ? Color.fromARGB(255, 242, 242, 242) : Colors.white,
          borderRadius: BorderRadius.circular(1),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${this.widget.market.name}", style: TextStyle(fontSize: 18)),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text("资金: ${this.widget.venture.venture_money}"),
                    Container(width: 10),
                    Text("持仓: ${this.widget.venture.trading_money}"),
                    Container(width: 10),
                    Text(
                        "比例: ${(this.widget.venture.trading_money / this.widget.venture.venture_money * 100).toStringAsFixed(2)}%"),
                  ],
                )),
            Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text("手数: ${this.widget.venture.venture_money}"),
                    Container(width: 10),
                    Text("收益: ${this.widget.venture.trading_money}"),
                    Container(width: 10),
                    Text(
                        "收益比: ${(this.widget.venture.trading_money / this.widget.venture.venture_money * 100).toStringAsFixed(2)}%"),
                  ],
                ))
          ],
        ),
      ),
    );
    return Cell;
  }
}
