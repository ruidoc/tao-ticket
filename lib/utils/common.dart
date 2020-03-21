import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  
  // 验证请求错误
  static void reactCode(code) async {
    if (code == 401) {
      navigatorKey.currentState.pushNamed('test_page');
    }
  }

  // 图标
  static final iconfont = (IconData iconfont, {
    double size,
    Color color,
  }) => Container(
    padding: EdgeInsets.only(bottom: 2),
    child: Icon(iconfont, size: size, color: color),
  );
  
}
