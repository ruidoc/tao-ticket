import 'package:flutter/material.dart';
import 'package:tao_ticket/pages/others/setting.dart';
import 'package:tao_ticket/pages/others/test_path.dart';

Map<String, WidgetBuilder> appRoutes = {
  'test_page': (context) => TestPath(),
  'setting': (context) => Setting(),
};