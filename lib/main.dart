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

Future<String> getTheme() async{
  SharedPreferences sp = await SharedPreferences.getInstance();
  String temp = sp.getString('theme');
  if(temp != null){
    return temp;
  } else{
    return 'Light';
  }
}

// 漫漫App
class MMapp extends StatefulWidget{
  final String theme;
  MMapp(this.theme);
  @override
  State<MMapp> createState()=>_MMapp(this.theme);
}
class _MMapp extends State<MMapp>{
  
  final String theme;
  _MMapp(this.theme);
  static String _theme;

  @override
  void initState(){
    super.initState();
    _theme = theme;
  }

  @override
  void dispose() {
    super.dispose();
  }

  changeTheme() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String temp = sp.getString('theme')=='Light'?'Dark':'Light';
    sp.setString('theme', temp);
    setState(() {
      _theme = temp;
    });
    print('Theme has changed to $temp!');
  }

  @override
  Widget build(BuildContext context){
    return DynamicTheme(
      theme: _theme,
      changeTheme: changeTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '漫漫',
        theme: DynamicTheme.themes[_theme],
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