import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tao_ticket/model/global/user.dart';
import 'package:tao_ticket/model/global/app.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final UserModel userInfo = Provider.of<UserModel>(context);
    return Scaffold(
      // backgroundColor: Color(0XFFF5F5F5),
      appBar: AppBar(
        title: Text('设置', style: TextStyle(
          fontSize: 18
        ),),
        elevation: 0,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),
            itemWarp('头像', trailing: ClipOval(
              child: Image.network(userInfo.avatar, width: 60),
            )),
            itemWarp('昵称', textValue: userInfo.name),
            itemWarp('性别', textValue: '男'),
            itemWarp('生日', textValue: '1月5日'),
            SizedBox(height: 10),
            itemWarp('收货地址', textValue: '共1个'),
            SizedBox(height: 10),
            itemWarp('黑暗模式', trailing: 
              Switch(
                value: Provider.of<AppMadel>(context).themeData.brightness == Brightness.dark, 
                onChanged: (_) {
                  Provider.of<AppMadel>(context, listen: false).changeThemeType();
                }
              ),
              offstage: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget itemWarp(String title, {
    String textValue, Widget trailing, bool offstage = false
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 13, horizontal: 18
      ),
      margin: EdgeInsets.only(
        bottom: 1,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        // border: Border(bottom: BorderSide(
        //   color: Colors.grey[100],
        //   width: 0.5
        // )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: TextStyle(
            fontSize: 14,
          )),
          Row(
            children: <Widget>[
              textValue is String ? Text(textValue, style: TextStyle(
                fontSize: 14, color: Colors.grey[700]
              )) : trailing,
              Offstage(
                offstage: offstage,
                child: Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
      // child: ListTile(
      //   title: Text(title, style: TextStyle(
      //     fontSize: 14,
      //   )),
      //   trailing: Text(title, style: TextStyle(
      //     fontSize: 14,
      //   )),
      //   contentPadding: EdgeInsets.symmetric(
      //     vertical: 0, horizontal: 18
      //   ),
      //   onTap: () {

      //   }
      // ),
    );
  }
}
