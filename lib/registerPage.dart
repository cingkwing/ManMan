import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'unify.dart';

class RegisterPage extends StatelessWidget{
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
          // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: Unify.px(1))),
          height: Unify.px(640),
          margin: EdgeInsets.fromLTRB(Unify.px(20), Unify.px(100), Unify.px(20), 0),
          child: Column(
            children: <Widget>[

              // 标题
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.fromLTRB(Unify.px(30), Unify.px(20), Unify.px(20), Unify.px(20)),
                alignment: Alignment.topLeft,
                child: Text(
                  '注册',
                  style: TextStyle(fontSize: Unify.px(35), fontWeight: FontWeight.bold),
                ),
              ),

              // 表单
              Container(
                height: Unify.px(320),
                alignment: Alignment.center,
                padding: EdgeInsets.all(Unify.px(10)),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: Unify.px(400),
                        height: Unify.px(75),
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: Unify.px(25)),
                          autocorrect: true,
                          inputFormatters: [LengthLimitingTextInputFormatter(11), WhitelistingTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: '手机号'
                          ),
                        ),
                      ),
                      Container(
                        width: Unify.px(400),
                        height: Unify.px(75),
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: Unify.px(25)),
                          inputFormatters: [LengthLimitingTextInputFormatter(16)],
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: '密码',
                          ),
                        ),
                      ),
                      Container(
                        width: Unify.px(400),
                        height: Unify.px(75),
                        child: TextField(
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: Unify.px(25)),
                          obscureText: true,
                          inputFormatters: [LengthLimitingTextInputFormatter(16)],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: '确认密码',
                          ),
                        ),
                      ),
                      Container(
                        width: Unify.px(400),
                        height: Unify.px(75),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: Unify.px(250),
                              height: Unify.px(75),
                              child: TextField(
                                inputFormatters: [LengthLimitingTextInputFormatter(16),WhitelistingTextInputFormatter.digitsOnly],
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: '验证码',
                                ),
                              )
                            ),
                            Container(
                              width: Unify.px(150),
                              height: Unify.px(75),
                              padding: EdgeInsets.fromLTRB(Unify.px(10), Unify.px(0), 0, Unify.px(15)),
                              child: FlatButton(
                                color: Colors.white54,
                                child: Text('发送验证码'),
                                onPressed: (){
                                  print('发送验证码!');   //TODO:接口3：发送验证码
                                },
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 提交按钮
              Container(
                height: Unify.px(100),
                alignment: Alignment.bottomCenter,
                child: OutlineButton(
                  highlightColor: Colors.white70,
                  splashColor: Colors.white,
                  highlightedBorderColor: Colors.black,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  child: Text('注册'),
                  onPressed: (){
                    print('接口3：向服务器发送注册数据验证请求!');// TODO:接口4：提交注册验证
                  },
                ),
              ),

              // 其他
              Container(
                width: Unify.px(400),
                height: Unify.px(100),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, '/loginPage');
                  },
                  child: Text(
                    '已有账号?',
                     style: TextStyle(color: Colors.grey, fontSize: Unify.px(20)),
                  ),
                ),
              ),

            ],
          ),
        ),
      )

    );
  }
}