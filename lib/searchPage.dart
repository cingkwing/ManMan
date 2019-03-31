import 'package:flutter/material.dart';
import 'unify.dart';
import 'util/resultItem.dart';
import 'testDatas.dart';

class SearchPage extends StatefulWidget{

  final List<String> kinds;
  final List<Map> results;
  SearchPage(this.kinds, this.results);

  @override
  _SearchPage createState()=> _SearchPage(kinds, results);
}
class _SearchPage extends State<SearchPage>{

  final List<String> kinds;
  final List<Map> results;
  _SearchPage(this.kinds, this.results);
  static List<Map> showResults = [];
  static List<Color> kindsColor = List.generate(20, (i)=>Colors.black38);

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
              
              // 输入栏
              Padding(
                padding: EdgeInsets.all(Unify.px(15)),
                child: Material(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(Unify.px(20)),
                  child: TextField(
                    style: TextStyle(fontSize: Unify.px(20)),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '搜索',
                      hintStyle: TextStyle(color: Colors.black12),
                      contentPadding: EdgeInsets.all(Unify.px(15)),
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(Unify.px(20))
                      )
                    ),
                    onSubmitted: (text){
                      print(text);
                      query();
                    },
                  ),
                ),
              ),

              // 条件区
              Container(
                padding: EdgeInsets.all(Unify.px(20)),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: Unify.px(50),
                      child: Text('类别：', style: TextStyle(color: Colors.black38, fontSize: Unify.px(25)))
                    ),
                    Container(
                      width: Unify.px(350),
                      height: Unify.px(50),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: kinds.length,
                        itemExtent: Unify.px(60),
                        itemBuilder: (context, index){
                          return Container(
                            height: Unify.px(10),
                            margin: EdgeInsets.only(left: Unify.px(5), right: Unify.px(5)),
                            child: GestureDetector(
                              onTap: (){
                                onKindTap(index);
                              },
                              child: Container(
                                child: Text(
                                  kinds[index],
                                  style: TextStyle(color: kindsColor[index], fontSize: Unify.px(25))
                                )
                              ),
                            ),
                          );
                        },
                      )
                    ),
                  ],
                ),
              ),

              // 结果区
              Container(
                width: Unify.px(460),
                height: Unify.px(1000),
                padding: EdgeInsets.all(Unify.px(20)),
                child: ListView.builder(
                  itemCount: showResults.length,
                  itemExtent: Unify.px(120),
                  itemBuilder: (context, index){
                    return ResultItem(showResults[index]);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void query(){
    setState(() {
      showResults = forSearch;
    });
  }

  void onKindTap(index){
    setState(() {
      kindsColor[index] = kindsColor[index]==Colors.black38?Colors.black:Colors.black38;
    });
  }
}