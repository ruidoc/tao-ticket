import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  UserModel({
    this.id = 1,
    this.name = 'ruims',
    this.avatar = 'https://image.9xsecndns.cn/image/uicon/1497767baad251f070329abb6ee4b9f8969df4019e06387.png?x-oss-process=image/resize,m_fill,h_310,w_310,limit_0'
  });

  int id;
  String name;
  String avatar;

  UserModel.create(Map json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }

  UserModel.update(Map json) {
    name = json['name'] ?? name;
    avatar = json['avatar'] ?? avatar;
    notifyListeners();
  }

}
