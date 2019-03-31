import 'package:flutter/material.dart';
import 'package:demo/unify.dart';

// 个人页矩形选项
class RectChoice extends StatelessWidget{

  final Map details;
  RectChoice(this.details);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, details['route']);
      },
      child: Container(
        width: Unify.px(215),
        height: Unify.px(250),
        // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: Unify.px(1))),
        child: Column(
          children: <Widget>[
            
            // 标题栏
            Container(
              height: Unify.px(25),
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: Unify.px(15)),
              child: Text(
                details['title'],
                style: TextStyle(color: Colors.black54, fontSize: Unify.px(25), fontWeight: FontWeight.bold),
              ),
            ),
            
            // 状态图标区域
            Container(
              margin: EdgeInsets.all(Unify.px(15)),
              width: Unify.px(215),
              height: Unify.px(195),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(Unify.px(15))
              ),
              child: Center(child: details['icon']),
            ),

          ],
        ),
      ),
    );
  }
}