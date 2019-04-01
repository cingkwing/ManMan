import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/unify.dart';
import 'package:demo/testDatas.dart';

class Attribute extends StatelessWidget{

  final String title;
  final String value;
  final List<TextInputFormatter> format;
  Attribute(this.title, this.value, this.format);

  void _fakeChangeRequest(newValue){
    for (var i = 0; i < forAttrs.length; i++) {
      if(forAttrs[i].containsValue(title)&&forAttrs[i].containsValue(value)){
        forAttrs[i]['value'] = newValue;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: Unify.px(100),
      padding: EdgeInsets.only(left: Unify.px(30), right: Unify.px(15)),
      margin: EdgeInsets.only(top: Unify.px(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            height: Unify.px(30),
            child: Text(title, style: TextStyle(fontSize: Unify.px(25), fontStyle: FontStyle.italic),),
          ),
          Padding(
            padding: EdgeInsets.only(top: Unify.px(10)),
            child: Container(
              width: Unify.px(360),
              height: Unify.px(60),
              decoration: BoxDecoration(color: Colors.white70 ,borderRadius: BorderRadius.circular(Unify.px(15))),
              child: TextField(
                style: TextStyle(fontSize: Unify.px(20)),
                inputFormatters: format,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: value,
                  contentPadding: EdgeInsets.all(Unify.px(20)),
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onSubmitted: (text){
                  _fakeChangeRequest(text);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}