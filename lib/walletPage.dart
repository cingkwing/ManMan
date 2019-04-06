import 'package:flutter/material.dart';
import 'unify.dart';

class WalletPage extends StatelessWidget{

  // Datas for debug
  static const double testBalance = 100.0;

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: PreferredSize(
        child: Padding(
          padding: EdgeInsets.all(Unify.px(5)),
          child: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).accentColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.receipt,
                  size: Unify.px(30),
                ),
                onPressed: (){
                  print('查看漫币收支记录');  //TODO:接口5：查看漫币收支记录请求
                },
              )
            ],
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
                  '漫币余额',
                  style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(35)),
                ),
              ),

              // 漫币余额卡
              Container(
                width: Unify.px(360),
                height: Unify.px(180),
                margin: EdgeInsets.only(top: Unify.px(20)),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(Unify.px(10))
                ),
                child: Center(
                  child: Text(
                    testBalance.toString(),
                    style: TextStyle(color: Theme.of(context).accentColor, fontSize: Unify.px(49)),
                  ),
                ),
              )

            ],
          )
        )
      ),
    );
  }
}