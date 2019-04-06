import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demo/unify.dart';
import 'package:demo/theme.dart';

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
                child: Text(_theme, style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(20))),
              ),
            ],
          ),
        ),
      )
    );
  }
}