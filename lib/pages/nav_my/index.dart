import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/model/app.dart';
import 'package:tao_ticket/pages/nav_my/custom_header.dart';

class MyIndex extends StatefulWidget {
  @override
  _MyIndexState createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  ScrollController _controller = new ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[50],
      // appBar: AppBar(
      //   title: Text('我的', style: TextStyle(
      //     fontSize: 14,
      //   ),),
      //   toolbarOpacity: 0.5,
      //   elevation: 0
      // ),
      body: CostomHeader(
        title: '我的',
        isStack: true,
        child: ListView(
          controller: _controller,
          padding: EdgeInsets.all(0),
          children: <Widget>[
            SizedBox(
              height: 900,
              child: Text('888'),
            ),
            FlatButton(
              child: Text('改变主题'),
              onPressed: () {
                Provider.of<AppMadel>(context, listen: false).changeThemeType();
              },
            ),
          ],
        ),
      ),
    );
  }
}
