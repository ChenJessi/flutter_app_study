


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CommonUtils{

  static getThemeData(Color color){
    return ThemeData(
      primarySwatch: color as MaterialColor?,
      platform: TargetPlatform.android,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarContrastEnforced: true,
              systemStatusBarContrastEnforced: true,
              systemNavigationBarColor: color,
              statusBarColor: color,
              systemNavigationBarDividerColor: color.withAlpha(199),
          ),
      ),
    );
  }
}
