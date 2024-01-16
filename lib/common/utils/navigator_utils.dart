

import 'package:flutter/cupertino.dart';
import '../../page/home/home_page.dart';
import '../../page/login/login_page.dart';

class NavigatorUtils{


  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  static goLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }
}