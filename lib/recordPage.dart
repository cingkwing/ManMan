import 'package:flutter/material.dart';
import 'unify.dart';

class RecordPage extends StatelessWidget{

  // Datas for debug
  final List<Map> records;
  RecordPage(this.records);

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
                  '个人动态',
                  style: TextStyle(fontSize: Unify.px(35)),
                ),
              ),

              // 动态
              Container(
                height: Unify.px(1000),
                // decoration: BoxDecoration(border: Border.all(color: Colors.black, width: Unify.px(1))),
                padding: EdgeInsets.all(Unify.px(20)),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: records.length,
                  itemExtent: Unify.px(160),
                  itemBuilder: (context, index){
                    return Container(
                      margin: EdgeInsets.only(bottom: Unify.px(15)),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(Unify.px(10))
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: Unify.px(120),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: Unify.px(30)),
                            child: Text(records[index]['content']),
                          ),
                          Container(
                            height: Unify.px(25),
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(right: Unify.px(25), bottom: Unify.px(10)),
                            child: Text(
                              records[index]['time'],
                              style: TextStyle(color: Colors.black38, fontSize: Unify.px(15))
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )

            ],
          )
        ),
      )

    );
  }
}