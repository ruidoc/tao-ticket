import 'package:flutter/material.dart';

class Utils {
  static final iconfont = (IconData iconfont, {
    double size,
    Color color,
  }) => Container(
    padding: EdgeInsets.only(bottom: 2),
    child: Icon(iconfont, size: size, color: color),
  );
}
