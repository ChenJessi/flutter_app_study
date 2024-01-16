
import 'package:flutter/material.dart';
import 'package:flutter_app_study/widget/particles/particles_widget.dart';

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
              Positioned.fill(child: ParticleWidget(30)),
              new Center(
                // 防止overFlow的现象
                child: SafeArea(
                  // 同时弹出键盘不遮挡
                  child: SingleChildScrollView(
                    child: new Card(
                        elevation: 5.0, //设置阴影
                    ),
                  ) ,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

