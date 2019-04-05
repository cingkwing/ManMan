import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
import 'package:demo/theme.dart';

void main() async{
  // debugPaintSizeEnabled = true;
  runApp(MMapp(await getTheme()));
}

Future<int> getTheme() async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  int temp = sp.getInt('themeIndex');
  if(temp != null){
    return temp;
  } else{
    return 0;
  }
}

// 漫漫App
class MMapp extends StatefulWidget{
  final int themeIndex;
  MMapp(this.themeIndex);
  @override
  State<MMapp> createState()=>_MMapp(this.themeIndex);
}
class _MMapp extends State<MMapp>{
  
  final int themeIndex;
  _MMapp(this.themeIndex);
  static int _themeIndex;

  @override
  void initState(){
    super.initState();
    _themeIndex = themeIndex;
  }

  @override
  void dispose() {
    super.dispose();
  }

  changeTheme() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    int temp = sp.getInt('themeIndex')==0?1:0;
    sp.setInt('themeIndex', temp);
    setState(() {
      _themeIndex = temp;
    });
  }

  @override
  Widget build(BuildContext context){
    return DynamicTheme(
      theme: _themeIndex,
      changeTheme: changeTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '漫漫',
        theme: DynamicTheme.themes[_themeIndex],
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
      ),
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
      // color: Colors.grey[100],
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