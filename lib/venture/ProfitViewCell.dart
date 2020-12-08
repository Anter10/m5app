import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m5app/common/Utils.dart';
import 'package:m5app/home/HistoryDetail.dart';
import 'package:m5app/home/MarketInfoView.dart';
import 'package:m5app/home/VentureView.dart';
import 'package:m5app/modal/Market.dart';
import 'package:m5app/modal/Venture.dart';

class ProfitViewCell extends StatefulWidget {
  Venture venture;
  ProfitViewCell(Venture venture) {
    this.venture = venture;
  }
  @override
  ProfitViewCellState createState() {
    return ProfitViewCellState();
  }
}

class ProfitViewCellState extends State<ProfitViewCell> {
  bool selected = false;

  showCupertinoActionSheet(Venture venture) async {
    var result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('${venture.id}: ${venture.id}'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('投资', style: TextStyle(color: nagivator_bottom_color,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return VentureView();
                    },
                  ));
                },
              ),
              CupertinoActionSheetAction(
                child: Text('详细情况',style: TextStyle(color: nagivator_bottom_color,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return MarketInfoView();
                    },
                  ));
                },
                isDestructiveAction: false,
              ),
              CupertinoActionSheetAction(
                child: Text('历史统计',style: TextStyle(color: nagivator_bottom_color,fontWeight: FontWeight.bold),),
                onPressed: () {
                  Navigator.of(context).pop('');
                  Navigator.push(context, MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return HistoryDetailView();
                    },
                  ));
                },
                isDestructiveAction: false,
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('取消',style: TextStyle(color: nagivator_bottom_color)),
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
         
        });
      },
      onTapUp: (e) {
        setState(() {
           this.selected = !this.selected;
           this.showCupertinoActionSheet(this.widget.venture);
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
      ),
    );
    return Cell;
  }
}
