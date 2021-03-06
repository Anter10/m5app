import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/HistoryDetail.dart';
import 'package:m5app/home/MarketInfoView.dart';
import 'package:m5app/home/VentureView.dart';
import 'package:m5app/modal/Market.dart';

class MarketInfoCell extends StatefulWidget {
  Market market;
  int type = 1;
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

  showCupertinoActionSheet(Market market) async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('${market.name}: ${market.description}'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  '投资',
                  style: TextStyle(
                      color: nagivator_bottom_color,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return VentureView(this.widget.market);
                    },
                  ));
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  '详情',
                  style: TextStyle(
                      color: nagivator_bottom_color,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MarketInfoView(this.widget.market);
                    },
                  ));
                },
                isDestructiveAction: false,
              ),
              // CupertinoActionSheetAction(
              //   child: Text(
              //     '历史统计',
              //     style: TextStyle(
              //         color: nagivator_bottom_color,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).pop('');
              //     Navigator.push(context, MaterialPageRoute<void>(
              //       builder: (BuildContext context) {
              //         return HistoryDetailView();
              //       },
              //     ));
              //   },
              //   isDestructiveAction: false,
              // ),
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
    DateTime date_time =
        DateTime.fromMillisecondsSinceEpoch(this.widget.market.time * 1000);
    var format =
        formatDate(date_time, [mm, ":", dd, ":", HH, ":", nn, ":", ss]);

    GestureDetector Cell = GestureDetector(
      onTapDown: (e) {
        setState(() {
          if (this.widget.type == 1) {
            this.selected = !this.selected;
          }
        });
      },
      onTapUp: (e) {
        setState(() {
          if (this.widget.type == 1) {
            this.selected = !this.selected;
            this.showCupertinoActionSheet(this.widget.market);
          }
        });
      },
      onTapCancel: () {
        setState(() {
          if (this.widget.type == 1) {
            this.selected = false;
          }
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
                                  text: "${format}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87)),
                              TextSpan(
                                  text: "",
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
