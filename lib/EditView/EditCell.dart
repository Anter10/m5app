import 'package:flutter/material.dart';

class EditCellInterface {
  Icon left_icon;
  String left_title;
}

class EditCell extends StatefulWidget {
  EditCellInterface cell;
  EditCell(EditCellInterface cell) {
    this.cell = cell;
  }
  @override
  EditCellState createState() {
    return EditCellState();
  }
}

class EditCellState extends State<EditCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                this.widget.cell.left_icon,
                SizedBox(
                  width: 15,
                ), //间距
                Text("${this.widget.cell.left_title}"), //标题
              ],
            ),
          ), //left
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.keyboard_arrow_right, size: 32, color: Colors.grey),
              ],
            ),
          ), //right
        ],
      ),
    );
  }
}
