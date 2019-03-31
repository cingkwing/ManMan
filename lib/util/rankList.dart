import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'dart:math';
import 'package:demo/unify.dart';
import 'package:demo/testDatas.dart';
import 'searchBar.dart';
import 'recommendBanner.dart';

// 排行推荐列表
class RankList extends StatefulWidget{
  @override
  _RankList createState()=>_RankList();
}
class _RankList extends State<RankList>{

  List<Widget> visibleItems = [RankListItem(forRankList[0]['title'], forRankList[0]['comic'])];
  ScrollController _controller = new ScrollController();
  bool isResquesting = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      if(_controller.position.pixels==_controller.position.maxScrollExtent){
        addItem();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _loader(){
    return Container(
      height: Unify.px(70),
      child: Opacity(
        opacity: isResquesting?1.0:0.0,
        child: SpinKitWave(
          size: 20,
          itemBuilder: (context, i)=>DecoratedBox(decoration: BoxDecoration(
            color: i.isEven?Colors.white:Colors.transparent,
            border: Border.all(color: i.isEven?Colors.black:Colors.transparent, width: Unify.px(1)),
            borderRadius: BorderRadius.circular(10)
          ),),
        ),
      )
    );
  }

  addItem() async{
    if(!isResquesting){
      setState(()=>isResquesting = true);
      Map newItem = await _fakeRequest();
      setState(() {
        visibleItems.add(RankListItem(newItem['title'], newItem['comic']));
        isResquesting = false;
      });
    }
  }

  _fakeRequest() async{
    return Future.delayed(Duration(seconds: 2), (){
      return forRankList[Random().nextInt(forRankList.length)];
    });
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(left: Unify.px(10)),
      height: Unify.px(900),
      child: ListView.builder(
        controller: _controller,
        itemCount: visibleItems.length+3,
        itemBuilder: (context, index){
          if(index!=visibleItems.length+2){
              switch(index){
              case 0: return SearchBar(); break;
              case 1: return RecommendBanner(forBanners); break;
              default: return visibleItems[index-2]; break;
            }
          } else{
            return _loader();
          }
        },
      ),
    );
  }
  // SpinKitWave(size: 30,itemBuilder: (context, i)=>DecoratedBox(decoration: BoxDecoration(color: i.isEven?Colors.transparent:Colors.black,borderRadius: BorderRadius.circular(10)),),)
}

// 排行推荐列表单个元素
class RankListItem extends StatelessWidget{
  
  final String title;
  final Map comic;
  RankListItem(this.title, this.comic);

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        print(comic['title']+' is taped!');  // TODO: 跳转漫画详情页
      },
      child: Container(
        height: Unify.px(285),
        margin: EdgeInsets.fromLTRB(Unify.px(15), Unify.px(15), Unify.px(15), 0),
        child: Column(
          children: <Widget>[
            // 类别栏
            Container(
              height: Unify.px(40),
              margin:EdgeInsets.only(bottom:Unify.px(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: Unify.px(30)),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: Unify.px(40),
                  ),
                ],
              ),
            ),

            // Top漫画推荐
            Container(
              height: Unify.px(240),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(comic['imgH']),
                    ),
                  ),
                  Container(
                    width: Unify.px(225),
                    height: Unify.px(240),
                    child: SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          text: comic['title']+'\n',
                          style: TextStyle(color: Colors.black, fontSize: Unify.px(25), fontWeight: FontWeight.bold),
                          children: <TextSpan>[
                            TextSpan(
                              text: '作者: '+comic['author']+'\n\n',
                              style: TextStyle(color: Colors.blue, fontSize: Unify.px(15), fontStyle: FontStyle.italic)
                            ),
                            TextSpan(
                              text: comic['summary']+'\n',
                              style: TextStyle(color: Colors.black54, fontSize: Unify.px(20))
                            ),
                          ]
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}