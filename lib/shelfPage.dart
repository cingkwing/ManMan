import 'package:flutter/material.dart';
import 'unify.dart';
import 'util/shelfList.dart';
import 'testDatas.dart';

class ShelfPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,

      // 标题栏
      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.all(Unify.px(5)),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'READING',
              style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(40), fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.all(0),
                color: Theme.of(context).accentColor,
                iconSize: Unify.px(40),
                icon: Icon(Icons.person),
                onPressed: (){
                  Navigator.pushNamed(context, '/personalPage');
                },
              )
            ],
          ),
        ),
        preferredSize: Size.fromHeight(Unify.px(60)),
      ),

      // 
      body: Container(
        height: Unify.px(690),
        margin: EdgeInsets.fromLTRB(Unify.px(15), Unify.px(80), Unify.px(15), 0),
        child: ShelfList(lastReading, forShelf),
      ),

    );
  }
}