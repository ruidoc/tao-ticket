import 'package:tao_ticket/model/global/app.dart';
import 'package:tao_ticket/model/global/user.dart';
import 'package:tao_ticket/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/routes/page.dart';
import 'package:tao_ticket/utils/common.dart';

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
      navigatorKey: Utils.navigatorKey,
      theme: Provider.of<AppMadel>(context).themeData,
      routes: appRoutes,
      home: HomePage(),
      // home: TestPath(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // print(state);
    if (state == AppLifecycleState.resumed) {}
  }
}

