import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/model/global/app.dart';
import 'package:tao_ticket/model/global/user.dart';
import 'package:tao_ticket/pages/nav_my/custom_scaffold.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class MyIndex extends StatefulWidget {
  @override
  _MyIndexState createState() => _MyIndexState();
}

class _MyIndexState extends State<MyIndex> {
  ScrollController _controller = new ScrollController();
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      double offset = _controller.offset / 50;
      if (offset < 0) {
        offset = 0;
      } else if (offset > 1) {
        offset = 1;
      }
      // print(offset);
      setState(() {
        _opacity = offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserModel>(context);
    return CostomScaffold(
      title: '我的',
      isStack: true,
      opacity: _opacity,
      child: ListView(
        controller: _controller,
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              top: 100,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        userInfo.avatar,
                        width: 60,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: <Widget>[
                            Utils.iconfont(
                              Iconfont.huiyuan11,
                              size: 12,
                            ),
                            Text(
                              '白银',
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            // height: 900,
            child: FlatButton(
              child: Text('888'),
              onPressed: () {
                Navigator.pushNamed(context, 'test_page');
              },
            ),
          ),
          FlatButton(
            child: Text('改变主题'),
            onPressed: () {
              Provider.of<AppMadel>(context, listen: false).changeThemeType();
            },
          ),
        ],
      ),
    );
  }
}
