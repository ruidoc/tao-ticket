import 'package:flutter/material.dart';

class AppMadel extends ChangeNotifier {
  ThemeData themeData = themeDataLight;

  static ThemeData themeDataDark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Iconfont',
    accentColor: Color(0xffeb002a),
  );

  static ThemeData themeDataLight = ThemeData(
    fontFamily: 'Iconfont',
    primaryColor: Colors.white,
    accentColor: Color(0xffeb002a),
  );

  // 修改主题
  void changeThemeType() {
    if (themeData.brightness == Brightness.light) {
      themeData = themeDataDark;
    } else {
      themeData = themeDataLight;
    }
    notifyListeners();
  }

}
