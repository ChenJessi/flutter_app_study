
import 'package:flutter/material.dart';

import '../../widget/animated_background.dart';

class LoginPage extends StatefulWidget {


  static const String sName = "login";

  const LoginPage({super.key});

  @override
  State createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // 触摸收起键盘
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Positioned.fill(child: AnimatedBackground()),
            ],
          ),
        ),
      ),
    );
  }

}

