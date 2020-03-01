import 'package:flutter/material.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class CostomHeader extends StatefulWidget {
  CostomHeader({
    this.title,
    this.child,
  });

  final String title;
  final Widget child;

  @override
  _CostomHeaderState createState() => _CostomHeaderState();
}

class _CostomHeaderState extends State<CostomHeader> {
  double paddingTop;

  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;
    return Container(
      // color: Colors.red,
      child: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            header(context),
            Flexible(
              child: Container(
                // color: Colors.red,
                child: widget.child
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: paddingTop, bottom: 10,
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Positioned(
            right: 15,
            child: Row(
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.only(

                  // ),
                  child: GestureDetector(
                    child: Utils.iconfont(
                      Iconfont.shezhi,
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
