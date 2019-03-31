import 'package:flutter/material.dart';
import 'unify.dart';
import 'discoverPage.dart';
import 'shelfPage.dart';
import 'personalPage.dart';
import 'loginPage.dart';
import 'registerPage.dart';
import 'accountPage.dart';
import 'recordPage.dart';
import 'walletPage.dart';
import 'settingsPage.dart';
import 'searchPage.dart';
import 'testDatas.dart';

void main(){
  // debugPaintSizeEnabled = true;
  runApp(MMapp());
}

// 漫漫App
class MMapp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '漫漫',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        body: HomePage(),
      ),
      routes: <String, WidgetBuilder>{
        '/personalPage': (BuildContext context)=> PersonalPage(),
        '/accountPage': (BuildContext context)=> AccountPage(),
        '/recordPage': (BuildContext context)=> RecordPage(forRecord),
        '/walletPage': (BuildContext context)=> WalletPage(),
        '/settingsPage': (BuildContext context)=> SettingsPage(),
        '/loginPage': (BuildContext context)=> LoginPage(),
        '/registerPage': (BuildContext context)=>RegisterPage(),
        '/searchPage': (BuildContext context)=>SearchPage(ComicKind.allKinds(), []),
      },
    );
  }
}

// 主页
class HomePage extends StatefulWidget{

  @override
  _HomePage createState()=> _HomePage();
}
class _HomePage extends State<HomePage> {
  
  PageController homePageController =PageController(
    initialPage: 1,
    keepPage: true,
    viewportFraction: 1.0
  );
  List<Widget> pages = [
    ShelfPage(),
    DiscoverPage(),
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.grey[100],
      padding: EdgeInsets.all(Unify.px(10)),
      child: PageView.builder(
        controller: homePageController,
        itemCount: 2,
        itemBuilder: (context, index){
          return pages[index];
        },
      )
    );
  }
}