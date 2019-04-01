import 'package:flutter/material.dart';
import 'unify.dart';
import 'package:demo/util/attribute.dart';
import 'testDatas.dart';

// TODO：理清数据格式，组件化各条信息
class AccountPage extends StatelessWidget{

  List<Map> _fakeRequest(){
    return forAttrs;
  }

  @override
  Widget build(BuildContext context){
    List<Map> _attrs = _fakeRequest();
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
                  '账号信息',
                  style: TextStyle(fontSize: Unify.px(35)),
                ),
              ),
              
              // 头像
              Container(
                height: Unify.px(120),
                padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
                margin: EdgeInsets.only(top: Unify.px(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: Unify.px(120),
                      child: Text('头像', style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),)
                    ),
                    GestureDetector(
                      onTap: (){
                        print('更换头像');  //TODO:更换头像
                      },
                      child: Image(
                        width: Unify.px(100),
                        height: Unify.px(100),
                        image: AssetImage('images/circularUser.png')
                      ),
                    ),
                  ],
                ),
              ),

              Attribute(_attrs[0]['title'], _attrs[0]['value'], null),
              Attribute(_attrs[1]['title'], _attrs[1]['value'], null),
              Attribute(_attrs[2]['title'], _attrs[2]['value'], null),
              Attribute(_attrs[3]['title'], _attrs[3]['value'], null),

              // 其他
              Container(
                width: Unify.px(360),
                height: Unify.px(60),
                margin: EdgeInsets.fromLTRB(Unify.px(30), Unify.px(50), Unify.px(15), 0),
                decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
                child: FlatButton(
                  child: Text('退出登录', style: TextStyle(fontSize: Unify.px(25))),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/loginPage');
                  },
                ),
              ),
            ],
          ),
        ),
      )

    );
  }
}