import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/unify.dart';
import 'package:demo/theme.dart';

class SettingChoice extends StatefulWidget{
  final String title;
  final Widget child;
  final Function() response;
  SettingChoice(this.title, this.child, this.response);
  @override
  State<SettingChoice> createState()=>_SettingChoice(this.title, this.child, this.response);
}
class _SettingChoice extends State<SettingChoice>{
  
  final String title;
  final Widget child;
  final Function() response;
  _SettingChoice(this.title, this.child, this.response);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: ()=>this.response,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: Unify.px(20)),
            child: Text(
              this.title,
              style: TextStyle(fontSize: Unify.px(25)),
            ),
          ),
          Container(
            width: Unify.px(80),
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: Unify.px(20)),
            child: this.child,
          ),
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget{
  @override
  State<ThemeSwitch> createState()=>_ThemeSwitch();
}
class _ThemeSwitch extends State<ThemeSwitch>{
  
  static String _theme;

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
  Widget build(BuildContext context){
    getTheme();
    return Container(
      height: Unify.px(500),
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
                child: Text('Light', style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(20))),
              ),
            ],
          ),
        ),
      )
    );
  }
}