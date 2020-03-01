import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/model/app.dart';
import 'package:tao_ticket/pages/nav_my/custom_header.dart';

class MyIndex extends StatefulWidget {
  @override
  _MyIndexState createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
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
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
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
