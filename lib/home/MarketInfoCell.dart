import 'package:flutter/material.dart';

class MarketInfoCell extends StatefulWidget {
  @override
  MarketInfoCellState createState() {
    return MarketInfoCellState();
  }
}

class MarketInfoCellState extends State<MarketInfoCell> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    GestureDetector Cell = GestureDetector(
      onTapDown: (e) {
        setState((){
          this.selected = !this.selected;
        });
      },
      onTapUp: (e) {
        setState((){
          this.selected = false;
        });
      },
      onTapCancel: () {
        setState((){
          this.selected = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: this.selected ? Color.fromARGB(255, 242, 242, 242) : Colors.white,
          borderRadius: BorderRadius.circular(1),
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        height: 120,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "黄金",
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
            Table(
              children: [
                TableRow(children: [
                  Text("点差: 45",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("多: 12344",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("高: 3333",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))
                ]),
                TableRow(children: [
                  Text("涨跌: 56",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("空: 12344",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("低: 2222",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))
                ])
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 5),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text("资金:12000元",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      Text("持仓:10手",
                          style:
                              TextStyle(fontSize: 14, color: Colors.black87)),
                      Text("盈利:10%",
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
