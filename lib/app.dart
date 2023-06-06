import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_study/redux/app_state.dart';
import 'package:redux/redux.dart';



class FlutterReduxApp extends StatefulWidget {

  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();

}

class _FlutterReduxAppState extends State<FlutterReduxApp> {


  /// 创建 store 用 AppState 中的appReducer 作为 Reducer
  /// initialState 初始化 AppState
  // final store = Store<AppState>(
  //     appReducer,
  //     // 拦截器
  //     middleware: middleware,
  //     initialState: AppState()
  // )
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}