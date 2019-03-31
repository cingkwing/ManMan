import 'package:flutter/material.dart';
import 'package:demo/unify.dart';

// 搜索栏
class SearchBar extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, '/searchPage'),
        
        // 搜索栏显示样式
        child: Container(
          height: Unify.px(40),
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(Unify.px(15), Unify.px(15), Unify.px(15), Unify.px(10)),
          padding: EdgeInsets.only(left: Unify.px(10)),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey, width: Unify.px(1)),
            color: Colors.white70,
            borderRadius: BorderRadius.circular(Unify.px(25))
          ),
          child: Icon(Icons.search),
        ),
        
      ),
    );
  }
}