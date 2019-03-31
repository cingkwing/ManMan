import 'package:flutter/material.dart';
import 'unify.dart';

// TODO：理清数据格式，组件化各条信息
class AccountPage extends StatelessWidget{
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
              
              // 昵称
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
                margin: EdgeInsets.only(top: Unify.px(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      height: Unify.px(30),
                      child: Text('昵称', style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Unify.px(10)),
                      child: Container(
                        width: Unify.px(360),
                        height: Unify.px(60),
                        decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
                        child: TextField(
                          style: TextStyle(fontSize: Unify.px(20)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '宋强',
                            contentPadding: EdgeInsets.all(Unify.px(20)),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              
              // 签名
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
                margin: EdgeInsets.only(top: Unify.px(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      height: Unify.px(30),
                      child: Text('签名', style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Unify.px(10)),
                      child: Container(
                        width: Unify.px(360),
                        height: Unify.px(60),
                        decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
                        child: TextField(
                          style: TextStyle(fontSize: Unify.px(20)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '这是一条无聊的签名',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Unify.px(7.5)),
                              borderSide: BorderSide(color: Colors.white70)
                            ),
                            contentPadding: EdgeInsets.all(Unify.px(20)),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 性别
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
                margin: EdgeInsets.only(top: Unify.px(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      height: Unify.px(30),
                      child: Text('性别', style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Unify.px(10)),
                      child: Container(
                        width: Unify.px(360),
                        height: Unify.px(60),
                        decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
                        child: TextField(
                          style: TextStyle(fontSize: Unify.px(20)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '男',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Unify.px(7.5)),
                              borderSide: BorderSide(color: Colors.white70)
                            ),
                            contentPadding: EdgeInsets.all(Unify.px(20)),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 年龄
              Container(
                height: Unify.px(100),
                padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
                margin: EdgeInsets.only(top: Unify.px(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      height: Unify.px(30),
                      child: Text('年龄', style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Unify.px(10)),
                      child: Container(
                        width: Unify.px(360),
                        height: Unify.px(60),
                        decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
                        child: TextField(
                          style: TextStyle(fontSize: Unify.px(20)),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '18',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Unify.px(7.5)),
                              borderSide: BorderSide(color: Colors.white70)
                            ),
                            contentPadding: EdgeInsets.all(Unify.px(20)),
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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