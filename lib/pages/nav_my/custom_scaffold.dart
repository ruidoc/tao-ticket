import 'package:flutter/material.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class CostomScaffold extends StatefulWidget {
  CostomScaffold({
    this.title,
    this.child,
    this.isStack = false,
    this.opacity = 1,
  });

  final String title;
  final Widget child;
  final bool isStack;
  final double opacity;

  @override
  _CostomScaffoldState createState() => _CostomScaffoldState();
}

class _CostomScaffoldState extends State<CostomScaffold> {
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
    return Opacity(
      opacity: widget.opacity,
      child: Container(
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
        Container(
          height: 200,
          color: Colors.red[400],
        ),
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
