import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:demo/unify.dart';
import 'package:demo/theme.dart';

// 主题更改键位
class ThemeSwitch extends StatefulWidget{
  @override
  State<ThemeSwitch> createState()=>_ThemeSwitch();
}
class _ThemeSwitch extends State<ThemeSwitch>{
  
  static String _theme = 'Light';

  getTheme() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String temp = sp.getString('theme');
    if(temp != null){
      _theme = temp;
    }
    else{
      _theme = 'Light';
    }
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    getTheme();
    return Container(
      height: Unify.px(40),
      margin: EdgeInsets.all(Unify.px(20)),
      child: GestureDetector(
        onTap: ()=>DynamicTheme.of(context).changeTheme(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: Unify.px(340),
                padding: EdgeInsets.only(left: Unify.px(20)),
                child: Text(
                  '风格',
                  style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(25)),
                ),
              ),
              Container(
                width: Unify.px(80),
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: Unify.px(20)),
                child: Text(_theme, style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(20))),
              ),
            ],
          ),
        ),
      )
    );
  }
}

// 清理缓存选项
class OperateChoice extends StatefulWidget{
  final String title;
  OperateChoice(this.title);
  @override
  State<OperateChoice> createState()=>_OperateChoice(this.title);
}
class _OperateChoice extends State<OperateChoice>{
  final String title;
  _OperateChoice(this.title);
  static String cacheSize;

  fakeRequest(){
    return '0 KB';
  }

  fakeOperate(){
    // TODO: 清理缓存文件
    setState((){
      final snackBar = new SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: Theme.of(context).primaryColor,
        content: new Text('清理完成', style: TextStyle(color: Theme.of(context).accentColor)),
        action: new SnackBarAction(
          textColor: Theme.of(context).primaryColorLight,
          label: '撤消',
          onPressed: () {
              // do something to undo
          }
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }
  
  @override
  Widget build(BuildContext context){
    cacheSize = fakeRequest();
    return Container(
      height: Unify.px(40),
      margin: EdgeInsets.all(Unify.px(20)),
      child: GestureDetector(
        onTap: ()=>fakeOperate(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: Unify.px(340),
                padding: EdgeInsets.only(left: Unify.px(20)),
                child: Text(
                  this.title,
                  style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(25)),
                ),
              ),
              Container(
                width: Unify.px(80),
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: Unify.px(20)),
                child: Text(cacheSize, style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(20))),
              ),
            ],
          ),
        ),
      )
    );
  }
}

// 反馈选项
class WithInputChoice extends StatelessWidget{
  
  final String title, hintText, buttonText;
  WithInputChoice(this.title, this.hintText, this.buttonText);

  @override
  Widget build(BuildContext context){
    TextEditingController _controller = TextEditingController();
    return Container(
      height: Unify.px(40),
      margin: EdgeInsets.all(Unify.px(20)),
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context){
              return SimpleDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Unify.px(15))),
                elevation: Unify.px(5),
                titlePadding: EdgeInsets.all(Unify.px(25)),
                contentPadding: EdgeInsets.all(Unify.px(25)),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: Text(this.title, style: TextStyle(color: Theme.of(context).accentColor)),
                children: <Widget>[
                  Container(
                    height: Unify.px(300),
                    child: TextField(
                      controller: _controller,
                      maxLines: 7,
                      maxLength: 105,
                      autofocus: true,
                      maxLengthEnforced: true,
                      style: TextStyle(color: Theme.of(context).accentColor),
                      decoration: InputDecoration(
                        hintText: this.hintText,
                        hintStyle: TextStyle(color: Colors.grey),
                        counterStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: Unify.px(1)),
                          borderRadius: BorderRadius.circular(Unify.px(10))
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: OutlineButton(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      textColor: Theme.of(context).accentColor,
                      // elevation: Unify.px(3),
                      borderSide: BorderSide(color: Colors.grey, width: Unify.px(1)),
                      child: Text(this.buttonText),
                      onPressed: (){
                        print(_controller.text);
                      },
                    ),
                  )
                ],
              );
            }
          );
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: Unify.px(340),
                padding: EdgeInsets.only(left: Unify.px(20)),
                child: Text(
                  this.title,
                  style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(25)),
                ),
              ),
              Container(
                width: Unify.px(80),
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: Unify.px(20)),
                child: Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
      )
    );
  }
}

class AboutChoice extends StatelessWidget{
  
  final String title;
  final String url;
  AboutChoice(this.title, this.url);

  _launchURL() async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context){
    return Container(
      height: Unify.px(40),
      margin: EdgeInsets.all(Unify.px(20)),
      child: GestureDetector(
        onTap: ()=>showDialog(
          context: context,
          builder: (BuildContext context){
            Timer(Duration(seconds: 1), ()=>showDialog(
              context: context,
              builder: (BuildContext context)=>AlertDialog(
                backgroundColor: Colors.transparent,
                title: Text('愿意为漫漫点亮一个star么？', style: TextStyle(color: Theme.of(context).accentColor)),
                actions: <Widget>[
                  FlatButton(
                    child: Text('愿意！'),
                    onPressed: ()=>_launchURL(),
                  ),
                ],
              )
            ));
            return SimpleDialog(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text('漫漫', style: TextStyle(color: Theme.of(context).accentColor)),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(Unify.px(25), Unify.px(25), Unify.px(25), Unify.px(5)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(Unify.px(10)),
                        child: Text('版本: 1.0.0', style: TextStyle(color: Theme.of(context).accentColor)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(Unify.px(10)),
                        child: Text('开发者: cingkwang', style: TextStyle(color: Theme.of(context).accentColor)),
                      ),
                      Image.asset('images/logo.png'),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: Unify.px(340),
                padding: EdgeInsets.only(left: Unify.px(20)),
                child: Text(
                  this.title,
                  style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(25)),
                ),
              ),
              Container(
                width: Unify.px(80),
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: Unify.px(20)),
                child: Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
              ),
            ],
          ),
        ),
      )
    );
  }
}