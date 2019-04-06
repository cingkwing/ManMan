import 'package:flutter/material.dart';

class DynamicTheme extends InheritedWidget{

  static Map themes = {
    // Light主题
    'Light': ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.black,
      canvasColor: Colors.white70,
      primaryColorDark: Colors.white70,
      primaryColorLight: Colors.grey,
      scaffoldBackgroundColor: Colors.grey[100],
    ),
    // Dark主题
    'Dark': ThemeData(
      primaryColor: Colors.black,
      accentColor: Colors.white,
      canvasColor: Colors.black,
      primaryColorDark: Colors.white,
      primaryColorLight: Colors.grey,
      scaffoldBackgroundColor: Color.fromRGBO(50, 50, 50, 1.0),
    ),
  };
  final String theme;
  final Function() changeTheme;

  DynamicTheme({
    @required this.theme,
    @required this.changeTheme,
    @required Widget child,
  }) : super(child: child);

  static DynamicTheme of(BuildContext context){
    return context.inheritFromWidgetOfExactType(DynamicTheme);
  }

  @override
  bool updateShouldNotify(DynamicTheme oldWidget) {
    return theme != oldWidget.theme;
  }
}