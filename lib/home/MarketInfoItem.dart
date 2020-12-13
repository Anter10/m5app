import 'package:flutter/material.dart';
import 'package:m5app/EditView/AboutView.dart';

class MarketInfoItemInterface {
  Icon left_icon;
  String left_title;
  String right_title;
  Function call;
}

class MarketInfoItem extends StatefulWidget {
  MarketInfoItemInterface cell;

  MarketInfoItem(MarketInfoItemInterface cell) {
    this.cell = cell;
  }
  @override
  MarketInfoItemState createState() {
    return MarketInfoItemState();
  }
}

class MarketInfoItemState extends State<MarketInfoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text("${this.widget.cell.left_title}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.black)),
                  ],
                ),
              ), //left
              Container(
                child: Row(
                  children: <Widget>[
                     Text("${this.widget.cell.right_title}",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 128, 128, 128))), 
                  ],
                ),
              ), //right
            ],
          ),
        ));
  }
}
