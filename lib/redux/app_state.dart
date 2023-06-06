
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_study/redux/user_redux.dart';
import 'package:redux/redux.dart';

import '../model/User.dart';
import 'grey_redux.dart';

/**
 * 全局 state
 * 保存一些全局状态
 */
class AppState{

  /// 用户信息
  User? userInfo;

  /// 语言
  Locale? locale;
  /// 当前手机语言
  Locale? platformLocale;

  /// 主题
 ThemeData? themeData;

  /// 是否登录
  bool? isLogin;

  /// 是否变灰色
  bool grey;

  AppState({
    this.userInfo,
    this.locale,
    this.platformLocale,
    this.themeData,
    this.isLogin,
    this.grey = false
  });

}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action){
  return AppState(
    userInfo: UserReducer(state.userInfo, action),
    grey: GreyReducer(state.grey, action),
  );
}


final List<Middleware<AppState>> middleware = [];