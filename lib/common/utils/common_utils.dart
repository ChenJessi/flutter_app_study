
import 'dart:ui';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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


  /**
   * 获取应用程序的存储目录
   */
  static getApplicationDocumentsPath() async {
    Directory appDir;
    if (Platform.isIOS) {
      appDir = await getApplicationDocumentsDirectory();
    } else {
      appDir = await getApplicationSupportDirectory();
    }
    String appDocPath = "${appDir.path}/flutter_app_study";
    Directory appPath = Directory(appDocPath);

    await appPath.create(recursive: true);
    return appPath.path;
  }


}
