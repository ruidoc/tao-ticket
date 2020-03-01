import 'package:flutter/material.dart';

class AppMadel with ChangeNotifier {

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

  void changeThemeType() {
    if (themeData.brightness == Brightness.light) {
      themeData = themeDataDark;
    } else {
      themeData = themeDataLight;
    }
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
