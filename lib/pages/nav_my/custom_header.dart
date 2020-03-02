import 'package:flutter/material.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class CostomHeader extends StatefulWidget {
  CostomHeader({
    this.title,
    this.child,
    this.isStack = false,
  });

  final String title;
  final Widget child;
  final bool isStack;

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
        child: widget.isStack ? stackLayout() : flowLayout(),
      ),
    );
  }

  Widget header(context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(
        top: paddingTop,
        bottom: 10,
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

  Widget flowLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        header(context),
        Flexible(
          child: Container(
            // color: Colors.red,
            child: widget.child,
          ),
        ),
      ],
    );
  }

  Widget stackLayout() {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: widget.child
        ),
        Positioned(
          left: 0, top: 0, right: 0,
          child: header(context),
        ),
      ],
    );
  }
}
