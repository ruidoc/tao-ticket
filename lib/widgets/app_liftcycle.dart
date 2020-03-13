import 'package:flutter/material.dart';

class AppLiftcycle extends StatefulWidget {
  @override
  _AppLiftcycleState createState() => _AppLiftcycleState();
}

class _AppLiftcycleState extends State<AppLiftcycle>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
    if (state == AppLifecycleState.paused) {
      print('进入后台');
    } else if(state == AppLifecycleState.resumed){
      print('进入前台');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
