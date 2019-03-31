import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:async';
import 'package:demo/unify.dart';

// 探索页Banner
class RecommendBanner extends StatefulWidget{

  final List<Map> specialColumns;
  RecommendBanner(this.specialColumns);

  @override
  State<StatefulWidget> createState() => _RecommendBanner(specialColumns);
}
class _RecommendBanner extends State<RecommendBanner>{
  
  final List<Map> specialColumns;
  _RecommendBanner(this.specialColumns);
  Timer bannerChanger;
  int currentColumn;
  List<Widget> _columns;
  Widget rightContent = Container(
    height: Unify.px(460),
    child: SpinKitHourGlass(color: Colors.black, size: 30, duration: Duration(milliseconds: 2500),),
  );

  @override
  Widget build(BuildContext context){
    return rightContent;
  }

  @override
  void initState() {
    super.initState();
    _columns = [createColumns(specialColumns[0]), createColumns(specialColumns[1])];
    bannerChanger = Timer.periodic(Duration(seconds: 3), (t){
      currentColumn = currentColumn==0?1:0;
      loadColumns(currentColumn); print('Banner Change to '+specialColumns[currentColumn]['column']);
    });
  }

  @override
  void dispose() {
    super.dispose();
    bannerChanger.cancel();
  }

  void loadColumns(index){
    setState(() {
      rightContent = _columns[index];
    });
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
                      style: TextStyle(color: Colors.black)
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