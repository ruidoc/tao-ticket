import 'package:flutter/material.dart';
import 'package:tao_ticket/pages/nav_film/index.dart';
import 'package:tao_ticket/pages/nav_home/index.dart';
import 'package:tao_ticket/pages/nav_my/index.dart';
import 'package:tao_ticket/utils/open_links.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [
    HomeIndex(),
    FilmIndex(),
    MyIndex(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    OpenLinks(context).initLinksStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Theme.of(context).accentColor,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconfont.shouye),
            activeIcon: Icon(
              Iconfont.shouye18,
            ),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconfont.yingyuan,
            ),
            activeIcon: Icon(
              Iconfont.yingyuan26,
            ),
            title: Text('电影'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Iconfont.wode,
            ),
            activeIcon: Icon(
              Iconfont.wode17,
            ),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
