import 'package:flutter/material.dart';
import 'package:tao_ticket/utils/open_links.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

class TestPath extends StatefulWidget {
  @override
  _TestPathState createState() => _TestPathState();
}

class _TestPathState extends State<TestPath> {
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test_path')),
      body: FlatButton(
        onPressed: () {
          Uri u = Uri.parse('taoTicket://test_page?id=1');
          print(u.authority);
        },
        child: Text('testdt'),
      ),
    );
  }
}
