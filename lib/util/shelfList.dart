import 'package:flutter/material.dart';
import 'package:demo/unify.dart';

// 书架展示卡片
class ShelfList extends StatefulWidget{

  final int lastReading;
  final List<Map> comics;
  ShelfList(this.lastReading, this.comics);

  @override
  _ShelfList createState()=> _ShelfList(lastReading, comics);
}
class _ShelfList extends State<ShelfList>{

  // Datas for debug
  final int lastReading;
  final List<Map> comics;
  _ShelfList(this.lastReading, this.comics);

  @override
  Widget build(BuildContext context){
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      controller: PageController(
        initialPage: lastReading,
        keepPage: true,
        viewportFraction: 1.0,
      ),
      itemCount: comics.length,
      itemBuilder: (context, index){
        return Center(
          child: Container(
            width: Unify.px(360),
            height: Unify.px(660),
            color: Colors.white70,
            child: Column(
              children: <Widget>[
                
                GestureDetector(
                  onTap: (){
                    print('To read '+comics[index]['title']); //TODO: 跳转漫画详情页
                  },
                  child: Column(
                    children: <Widget>[
                      // 图片
                      Container(
                        height: Unify.px(435),
                        padding: EdgeInsets.fromLTRB(Unify.px(20), Unify.px(30), Unify.px(20), Unify.px(15)),
                        child: Image(
                          width: Unify.px(225),
                          height: Unify.px(300),
                          image: AssetImage(comics[index]['imgH']),
                        ),
                      ),
                      // 简介（淡金色）
                      Container(
                        color: Colors.yellow[50],
                        width: Unify.px(360),
                        height: Unify.px(105),
                        padding: EdgeInsets.all(Unify.px(10)),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: comics[index]['title']+'\n',
                                style: TextStyle(color: Colors.black54, fontSize: Unify.px(30))
                              ),
                              TextSpan(
                                text: comics[index]['author'],
                                style: TextStyle(color: Colors.black, fontSize: Unify.px(20), fontWeight: FontWeight.bold)
                              )
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // 数量指示
                Container(
                  color: Colors.grey[100],
                  height: Unify.px(120),
                  alignment: Alignment.bottomCenter,
                  child: Text('<  '+(index+1).toString()+' / '+comics.length.toString()+'  >'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}