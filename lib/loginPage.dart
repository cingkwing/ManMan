import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'unify.dart';

class LoginPage extends StatelessWidget{
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
          height: Unify.px(500),
          margin: EdgeInsets.fromLTRB(Unify.px(20), Unify.px(100), Unify.px(20), 0),
          child: Column(
            children: <Widget>[

              // 标题
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.fromLTRB(Unify.px(30), Unify.px(20), Unify.px(20), Unify.px(20)),
                alignment: Alignment.topLeft,
                child: Text(
                  '登录',
                  style: TextStyle(fontSize: Unify.px(35), fontWeight: FontWeight.bold),
                ),
              ),

              // 表单
              Container(
                height: Unify.px(200),
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
                          inputFormatters: [LengthLimitingTextInputFormatter(11),WhitelistingTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person_outline),
                            hintText: '账号'
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
                            hintText: '密码',
                          ),
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
                  child: Text('登录'),
                  onPressed: (){
                    print('接口1：向服务器发送登录数据验证请求!');// TODO: 接口1：提交登录验证
                  },
                ),
              ),

              // 其他
              Container(
                width: Unify.px(400),
                height: Unify.px(100),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        print('接口2：向服务器发送忘记密码请求!');  //TODO: 接口2：忘记密码请求
                      },
                      child: Text(
                        '忘记密码?',
                        style: TextStyle(color: Colors.grey, fontSize: Unify.px(20)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/registerPage');
                      },
                      child: Text(
                        '没有账号?',
                        style: TextStyle(color: Colors.grey, fontSize: Unify.px(20)),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      )

    );
  }
}