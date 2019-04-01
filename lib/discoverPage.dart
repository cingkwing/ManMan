import 'package:flutter/material.dart';
import 'unify.dart';
import 'util/recommendBanner.dart';
import 'util/searchBar.dart';
import 'util/rankList.dart';


class DiscoverPage extends StatefulWidget{
  @override
  _DiscoverPage createState()=>_DiscoverPage();
}
class _DiscoverPage extends State<DiscoverPage>{

  ScrollController _controller = new ScrollController();
  RankList rankList = new RankList();

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      if(_controller.position.pixels==_controller.position.maxScrollExtent){
        setState(() {
         rankList.addItem(); 
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context){

    // 屏幕适配调试输出String
    // String _unifySettings = 'px: '+Unify.one().toString()+'\n屏幕宽度: '+Unify.screenWidth().toString()+'\n屏幕高度: '+Unify.screenHeight().toString()+'\n屏幕上间距: '+Unify.padTopH().toString()+'\n屏幕下间距: '+Unify.padBottomH().toString();

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
              'DISCOVER',
              style: TextStyle(color: Colors.black, fontSize: Unify.px(40), fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                padding: EdgeInsets.all(0),
                color: Colors.black,
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
      
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          width: Unify.px(480),
          padding: EdgeInsets.all(Unify.px(5)),
          child: Column(
            children: <Widget>[
              SearchBar(),
              RecommendBanner(),
              rankList,
            ],
          )
        ),
      ),

    );
  }
}