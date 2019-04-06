import 'package:flutter/material.dart';
import 'unify.dart';
import 'util/rectChoice.dart';

class PersonalPage extends StatelessWidget{

  // Datas for debug
  static List<Map> _choices = [
    {'title': '账号', 'route': '/accountPage', 'icon': Icons.create},
    {'title': '动态', 'route': '/recordPage', 'icon': Icons.reorder},
    {'title': '漫币', 'route': '/walletPage', 'icon': Icons.account_balance_wallet},
    {'title': '设置', 'route': '/settingsPage', 'icon': Icons.settings},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      // 标题栏
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.all(Unify.px(5)),
          child: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        preferredSize: Size.fromHeight(Unify.px(60)),
      ),

      // 内容
      body: Container(
        padding: EdgeInsets.fromLTRB(Unify.px(25), Unify.px(10), Unify.px(25), 0),
        child: Column(
          children: <Widget>[
            
            // 头像
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/loginPage');
              },
              child: Container(
                height: Unify.px(350),
                child: Center(
                  child: Container(
                    height: Unify.px(200),
                    child: Column(
                      children: <Widget>[
                        ClipOval(
                          child: Image(
                            width: Unify.px(130),
                            height: Unify.px(130),
                            image: AssetImage('images/circularUser.png'),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text:TextSpan(
                            text: '登录/注册\n',
                            style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(30), fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '打开属于你的个人空间',
                                style: TextStyle(fontSize: Unify.px(15)),
                              )
                            ]
                          )
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
            
            // 选项
            Container(
              padding: EdgeInsets.all(Unify.px(10)),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RectChoice(_choices[0]),
                      RectChoice(_choices[1]),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      RectChoice(_choices[2]),
                      RectChoice(_choices[3]),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}