import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TestPath extends StatefulWidget {
  @override
  _TestPathState createState() => _TestPathState();
}

class _TestPathState extends State<TestPath>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List _list = [3, 5, 8];
  bool _first = false;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试页面'),
      ),
      body: ListView(
        children: <Widget>[
          _gridview(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // setState(() => selected = !selected);
          _list.add('value');
        },
      ),
    );
  }

  Widget _animatedBuilder() {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Wee'),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * pi,
          child: child,
        );
      },
    );
  }

  Widget _animatedCross() {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 1),
      firstChild:
          const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
      secondChild:
          const FlutterLogo(style: FlutterLogoStyle.stacked, size: 100.0),
      crossFadeState:
          _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget _animatedContainer() {
    return AnimatedContainer(
      width: selected ? 200.0 : 100.0,
      height: selected ? 100.0 : 200.0,
      color: selected ? Colors.red : Colors.blue,
      alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: FlutterLogo(size: 75),
    );
  }

  Widget _animatedListState() {
    return AnimatedList(
      // key: listKey,
      shrinkWrap: true,
      initialItemCount: _list.length,
      itemBuilder: (BuildContext context, int index, Animation an) => ListTile(
        title: Text('data'),
      ),
    );
  }

  Widget _gridview() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 10/15,
      shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('He\'d have you all unravel at the'),
          color: Colors.teal[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.teal[200],
        ),
      ],
    );
  }
}
