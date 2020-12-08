import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m5app/modal/Market.dart';

class MarketInfoCell extends StatefulWidget {
  Market market;
  MarketInfoCell(Market market) {
    this.market = market;
  }
  @override
  MarketInfoCellState createState() {
    return MarketInfoCellState();
  }
}

class MarketInfoCellState extends State<MarketInfoCell> {
  bool selected = false;

  showCupertinoActionSheet() async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('关于HK50的操作'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('投资'),
                onPressed: () {
                  Navigator.of(context).pop('delete');
                },
              ),
              CupertinoActionSheetAction(
                child: Text('详细情况'),
                onPressed: () {
                  Navigator.of(context).pop('not delete');
                },
                isDestructiveAction: false,
              ),
              CupertinoActionSheetAction(
                child: Text('历史统计'),
                onPressed: () {
                  Navigator.of(context).pop('not delete');
                },
                isDestructiveAction: false,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消'),
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
          this.showCupertinoActionSheet();
        });
      },
      onTapUp: (e) {
        setState(() {
          this.selected = false;
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
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    height: 30,
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "${this.widget.market.name}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: " ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87)),
                              TextSpan(
                                  text: "22:00:00",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Table(
              children: [
                TableRow(children: [
                  Text("多: ${this.widget.market.ask}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("高: ${this.widget.market.askhigh}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))
                ]),
                TableRow(children: [
                  Text("空: ${this.widget.market.bid}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("低: ${this.widget.market.asklow.toStringAsFixed(5)}",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))
                ])
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 10),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text(
                          "资金:${(this.widget.market.market_total_venture / 10000).toStringAsFixed(0)}万",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      Text("持仓:${this.widget.market.market_total_order_count}手",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      Text(
                          "盈利:${(this.widget.market.market_total_profit / 10000).toStringAsFixed(0)}万",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                    ])
                  ],
                ))
          ],
        ),
      ),
    );
    return Cell;
  }
}
