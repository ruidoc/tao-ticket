import 'package:flutter/material.dart';
import 'package:tao_ticket/pages/nav_film/cinema_page.dart';
import 'package:tao_ticket/widgets/tic_header.dart';

class FilmIndex extends StatefulWidget {
  const FilmIndex({Key key}) : super(key: key);
  @override
  _FilmIndexState createState() => _FilmIndexState();
}

class _FilmIndexState extends State<FilmIndex>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: '热映'),
    Tab(text: '影院'),
    Tab(text: '即将上映'),
    Tab(text: '在线看'),
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
          bottom: PreferredSize(
            preferredSize: Size.infinite,
            child: Align(
              alignment: Alignment.centerLeft,
              child: _tabBar(),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CinemaPage(),
          CinemaPage(),
          CinemaPage(),
          CinemaPage(),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
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
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
          width: 2,
          style: BorderStyle.solid,
        ),
        insets: EdgeInsetsDirectional.only(bottom: 8),
      ),
    );
  }
}
