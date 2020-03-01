import 'package:flutter/material.dart';
import 'package:tao_ticket/pages/nav_home/recommend_page.dart';
import 'package:tao_ticket/widgets/tic_header.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({Key key}) : super(key: key);
  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: '精选'),
    Tab(text: '超级预告'),
    Tab(text: '演唱会'),
    Tab(text: '话剧歌剧'),
  ];

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(88),
        child: AppBar(
          elevation: 0,
          title: TicHeader(),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            unselectedLabelColor: Colors.grey[500],
            // unselectedLabelStyle: TextStyle(
            //   color: Colors.grey[100],
            //   fontWeight: FontWeight.bold,
            //   fontSize: 14
            // ),
            // dragStartBehavior:,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                  width: 2,
                  style: BorderStyle.solid),
              insets: EdgeInsetsDirectional.only(bottom: 8),
            ),
            // indicatorColor: Colors.white
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          RecommendPage(),
          RecommendPage(),
          RecommendPage(),
          RecommendPage(),
        ],
      ),
    );
  }

  void _onScroll(offset) {
    print(offset);
  }
}
