import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:demo/unify.dart';
import 'package:demo/testDatas.dart';

// 探索页Banner
class RecommendBanner extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _RecommendBanner();
}
class _RecommendBanner extends State<RecommendBanner>{
  
  Timer bannerChanger;
  static Color theColor = Colors.grey;
  int currentColumn;
  List<Widget> _columns;
  Widget rightContent = Container(
    height: Unify.px(460),
    child: SpinKitHourGlass(color: theColor, size: 30, duration: Duration(milliseconds: 2500))
  );

  @override
  Widget build(BuildContext context){
    return rightContent;
  }

  @override
  void initState() {
    super.initState();
    List<Map> receiveColumns = _fakeRequest();
    _columns = [createColumns(receiveColumns[0]), createColumns(receiveColumns[1])];
    bannerChanger = Timer.periodic(Duration(seconds: 3), (t){
      currentColumn = currentColumn==0?1:0;
      loadColumns(currentColumn); //print('Banner Change to '+forBanners[currentColumn]['column']);
    });
  }

  @override
  void dispose() {
    super.dispose();
    bannerChanger.cancel();
  }

  // 更换栏目函数
  void loadColumns(index){
    setState(() {
      theColor = Theme.of(context).accentColor;
      rightContent = _columns[index];
    });
  }

  List<Map> _fakeRequest(){
    return forBanners;
  }

  Widget createColumns(Map currentColumn){
    return Container(
      height: Unify.px(460),
      margin: EdgeInsets.only(left: Unify.px(5), right: Unify.px(5)),
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.fromLTRB(Unify.px(10), Unify.px(10), Unify.px(10), 0),
        child: Column(
          children: <Widget>[
            // Banner图片
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Unify.px(15))),
              child: ClipRRect(
                child: Image(image: AssetImage(currentColumn['comic']['imgW'])),
                borderRadius: BorderRadius.circular(Unify.px(10)),
              ),
            ),
            // Banner推荐语
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(Unify.px(10), Unify.px(10), Unify.px(10), 0),
              child: RichText(
                text: TextSpan(
                  text: currentColumn['column'],
                  style: TextStyle(color: Colors.blue),
                  children: <TextSpan>[
                    TextSpan(
                      text: currentColumn['comic']['brief'],
                      style: TextStyle(color: theColor),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}