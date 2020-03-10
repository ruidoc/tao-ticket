import 'package:tao_ticket/model/global/app.dart';
import 'package:tao_ticket/model/global/user.dart';
import 'package:tao_ticket/pages/nav_film/index.dart';
import 'package:tao_ticket/pages/nav_home/index.dart';
import 'package:tao_ticket/pages/nav_my/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/pages/others/test_path.dart';
import 'package:tao_ticket/utils/open_links.dart';
import 'package:tao_ticket/widgets/Iconfont.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<AppMadel>(create: (_) => AppMadel()),
      ChangeNotifierProvider<UserModel>(create: (_) => UserModel()),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '淘票票',
      theme: Provider.of<AppMadel>(context).themeData,
      routes: {
        'test_page': (context) => TestPath()
      },
      home: MyHomePage(),
      // home: TestPath(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // print(state);
    if (state == AppLifecycleState.resumed) {
      
    }
  }

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
