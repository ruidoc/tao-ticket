import 'package:flutter/material.dart';
import 'package:tao_ticket/pages/nav_home/image_pick.dart';
import 'package:tao_ticket/utils/common.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class TicHeader extends StatefulWidget {
  TicHeader({
    Key key,
    this.showTimer = false,
  });

  final bool showTimer;

  @override
  _TicHeaderState createState() => _TicHeaderState();
}

class _TicHeaderState extends State<TicHeader> {
  TextEditingController _searchController = TextEditingController();
  Map cityData = {
    'id': 1,
    'name': '北京',
  };
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // padding: EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  cityData['name'],
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  ' ▼',
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context,'test_path');
            },
          ),
          Expanded(
            child: Container(
              height: 35,
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              decoration: BoxDecoration(
                color: Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 3, right: 4),
                    child: Utils.iconfont(
                      Iconfont.sousuo,
                      size: 17,
                      color: Colors.grey[600],
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '搜影片，影院，影人',
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.only(
                          bottom: 11,
                        ),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: Utils.iconfont(
                Iconfont.rili,
              ),
            ),
          ),
          GestureDetector(
            child: Utils.iconfont(
              Iconfont.saoyisao,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return ImagePick();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
