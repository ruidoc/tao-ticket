
import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
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
          // _customMultiChildLayout(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // setState(() => selected = !selected);
          // _list.add('value');
          // showPickerModal(context);
          selectCity(context);
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

  // 渐入渐出
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

  // 动画容器
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

  // 动画列表
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

  // 网格布局
  Widget _gridview() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 10 / 15,
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

  // 表格布局
  Widget _tableLayot() {
    return Table(
      columnWidths: <int, TableColumnWidth>{
        0: FixedColumnWidth(50.0),
        1: FixedColumnWidth(100.0),
        2: FixedColumnWidth(50.0),
        3: FixedColumnWidth(100.0),
      },
      border: TableBorder.all(
        color: Colors.red,
        width: 1.0,
      ),
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Text('A1'),
            Text('B1'),
            Text('C1'),
            Text('D1'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A2'),
            Text('B2'),
            Text('C2'),
            Text('D2'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A3'),
            Text('B3'),
            Text('C3'),
            Text('D3'),
          ],
        ),
      ],
    );
  }

  // wrap案例
  Widget _wrapDemo() {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 0.0, // gap between lines
      // runAlignment: WrapAlignment.start,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: new Text(
                'AH',
                style: TextStyle(fontSize: 10.0),
              )),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: new Text(
                'ML',
                style: TextStyle(fontSize: 10.0),
              )),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: new Text(
                'HM',
                style: TextStyle(fontSize: 10.0),
              )),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              child: new Text(
                'JL',
                style: TextStyle(fontSize: 10.0),
              )),
          label: Text('Laurens'),
        ),
      ],
    );
  }

  // 展示时间日期
  void showPickerModal(BuildContext context) {
    new Picker(
      cancelText: '取消',
      confirmText: '确定',
      adapter: PickerDataAdapter(
          // pickerdata: [
          //   '中国', '美国', '日本'
          // ]
          ),
      changeToFirst: true,
      hideHeader: false,
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.adapter.text);
      },
    ).showModal(this.context); //_scaffoldKey.currentState);
  }

  // 选择省市区
  void selectCity(context) async {
    Result result = await CityPickers.showCityPicker(
      context: context,
    );
    // Result result = await CityPickers.showFullPageCityPicker(
    //   context: context,
    // );
    // Result result = await CityPickers.showCitiesSelector(
    //   context: context,
    // );
    print('999: '+result.toString());
  }
}
