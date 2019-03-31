import 'package:flutter/material.dart';
import 'unify.dart';
// TODO: 如何组件化各个选项，是个问题.

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPage createState()=> _SettingsPage();
}
class _SettingsPage extends State<SettingsPage>{

  // Datas for debug
  static bool theValue = true;
  List<Map> testItems = [
    {'first': '风格', 'second': Text('Light', style: TextStyle(color: Colors.black38, fontSize: Unify.px(20)))},
    {'first': '流量提醒', 'second': Switch(
                                      value: theValue,
                                      onChanged: (newValue){},
                                      activeColor: Colors.black,
                                      activeTrackColor: Colors.white70,
                                      inactiveTrackColor: Colors.white70,
                                      inactiveThumbColor: Colors.white70,
                                    )},
    {'first': '清除缓存', 'second':Text('0 KB', style: TextStyle(color: Colors.black38, fontSize: Unify.px(20)))},
    {'first': '反馈', 'second': Icon(Icons.chevron_right)},
    {'first': '关于', 'second': Icon(Icons.chevron_right)},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.all(Unify.px(5)),
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        preferredSize: Size.fromHeight(Unify.px(60)),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Unify.px(20)),
          child: Column(
            children: <Widget>[
              
              // 标题栏
              Container(
                height: Unify.px(75),
                padding: EdgeInsets.all(Unify.px(20)),
                alignment: Alignment.topLeft,
                child: Text(
                  '通用设置',
                  style: TextStyle(fontSize: Unify.px(35)),
                ),
              ),

              // 选项
              Container(
                height: Unify.px(500),
                margin: EdgeInsets.all(Unify.px(20)),
                child: ListView.builder(
                  itemCount: testItems.length,
                  itemExtent: Unify.px(90),
                  itemBuilder: (context, index){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: Unify.px(20)),
                          child: Text(
                            testItems[index]['first'],
                            style: TextStyle(fontSize: Unify.px(25)),
                          ),
                        ),
                        Container(
                          width: Unify.px(80),
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: Unify.px(20)),
                          child: testItems[index]['second'],
                        ),
                      ],
                    );
                  },
                ),
              )

            ],
          )
        )
      ),

    );
  }
}