import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_study/common/localizations/app_localizations_delegate.dart';
import 'package:flutter_app_study/page/debug/debug_label.dart';
import 'package:flutter_app_study/page/home/home_page.dart';
import 'package:flutter_app_study/page/welcome_page.dart';
import 'package:flutter_app_study/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'common/style/app_style.dart';
import 'common/utils/common_utils.dart';
import 'model/User.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class FlutterReduxApp extends StatefulWidget {

  @override
  _FlutterReduxAppState createState() => _FlutterReduxAppState();

}

class _FlutterReduxAppState extends State<FlutterReduxApp>
  with HttpErrorListener{


  /// 创建 store 用 AppState 中的appReducer 作为 Reducer
  /// initialState 初始化 AppState
  final store = Store<AppState>(
      appReducer,
      // 拦截器
      middleware: middleware,
      initialState: AppState(
        userInfo: User.empty(),
        isLogin: false,
        themeData: CommonUtils.getThemeData(APPColors.primarySwatch),
        locale: const Locale('zh', 'CH'),
      )
  );


  NavigatorObserver navigatorObserver = NavigatorObserver();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), (){
      /// 通过 with NavigatorObserver 这里可以往上获取到
      /// MaterialApp 和 StoreProvider 的 context
      /// 还可以获取到 navigator
      /// 比如这里增加监听，如果登陆失效就返回登陆页
      navigatorObserver.navigator?.context;
      navigatorObserver.navigator;
    });

  }



  @override
  Widget build(BuildContext context) {
    /// 使用 flutter_redux 做全局状态共享
    /// 通过StoreProvider 应用 store
    return StoreProvider(
      store: store,
      child: StoreBuilder<AppState>(builder: (context, store){
        /// 使用StoreBuilder 获取 store 中的 themeData
        store.state.platformLocale = WidgetsBinding.instance.window.locale;

        Widget app = MaterialApp(
            navigatorKey: navKey,
          /// 多语言实现
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizationsDelegate.delegate
            ],
            supportedLocales : [
              store.state.locale ?? store.state.platformLocale!
            ],
          locale : store.state.locale,
          theme: store.state.themeData,
          navigatorObservers: [navigatorObserver],

          /// 命名式路由
          /// “/” 和 MaterialApp 的 home 参数对应的路由是一样的
          /// 这里的 name 调用，里面的 pageContainer 方法有一个 MediaQuery.of(context).copyWith(textScaleFactor: 1),
          /// 这里的 context 用的 WidgetBuilder 的 context

          routes: {
            WelComePage.sName: (context) {
              DebugLabel.showDebugLabel(context);
              return WelComePage();
            } ,
            HomePage.sName: (context) {
              DebugLabel.showDebugLabel(context);
              return HomePage();
            },
          }

        );

        return app;
      }),
    );
  }

}

mixin HttpErrorListener on State<FlutterReduxApp>{

  GlobalKey<NavigatorState> navKey = GlobalKey();

}
