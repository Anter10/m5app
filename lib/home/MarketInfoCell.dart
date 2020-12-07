import 'package:flutter/material.dart';
import 'package:m5app/modal/Market.dart';

class MarketInfoCell extends StatefulWidget {
  Market market;
  MarketInfoCell(Market market){
      this.market = market;
  }
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
            Table(
              children: [
                TableRow(children: [
                
                  Text("多: ${this.widget.market.ask}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("高: ${this.widget.market.askhigh}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))
                ]),
                TableRow(children: [
                 
                  Text("空: ${this.widget.market.bid}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold)),
                  Text("低: ${this.widget.market.asklow}",
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
