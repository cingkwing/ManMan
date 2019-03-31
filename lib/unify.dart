import 'package:flutter/material.dart';
import 'dart:ui';

class Unify{

  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;

  static init(int number){
    int uiWidth = number is int ? number:500;
    _ratio = _width/uiWidth;
  }

  static px(number){
    if( !(_ratio is double || _ratio is int)){
      Unify.init(500);
    }
    return number*_ratio;
  }

  static one()=> 1/_pixelRatio;
  static screenWidth()=> _width;
  static screenHeight()=> _height;
  static padTopH()=> _topbarH;
  static padBottomH()=> _botbarH;
}