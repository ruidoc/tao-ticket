import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class OpenLinks {
  OpenLinks(this.context);
  BuildContext context;
  static Map query; //参数
  static String authority; //路径

  Future initLinksStream() async {
    // 首次打开
    try {
      String link = await getInitialLink();
      _transLink(link);
      _handelAction();
      // fun(authority, query);
    } catch (err) {
      print("err2==== $err");
    }

    // 冷启动
    getLinksStream().listen((String link) {
      _transLink(link);
      _handelAction();
      // fun(authority, query);
    }, onError: (err) {
      print("err1==== $err");
    });
  }

  static void _transLink(String link) {
    Uri u = Uri.parse(link);
    query = u.queryParameters;
    authority = u.authority;
  }

  void _handelAction() {
    print(authority);
    if (authority == 'test_page') {
      Navigator.of(context).pushNamed('test_page');
    }
  }
}
