import 'package:flutter/material.dart';
import 'package:demo/unify.dart';

// 搜索结果单项
class ResultItem extends StatelessWidget{
  
  final Map _comic;
  ResultItem(this._comic);

  @override
  Widget build(BuildContext context){
    return Container(
      width: Unify.px(450),
      margin: EdgeInsets.only(bottom: Unify.px(15)),
      child: Row(
        children: <Widget>[
          Container(
            width: Unify.px(150),
            height: Unify.px(100),
            child: Image(image: AssetImage(_comic['imgW'])),
          ),
          Container(
            width: Unify.px(250),
            height: Unify.px(100),
            child: RichText(
              text: TextSpan(
                text: _comic['title']+'\n',
                style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(25)),
                children: <TextSpan>[
                  TextSpan(text: _comic['brief'], style: TextStyle(fontSize: Unify.px(15)))
                ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}