import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_study/common/utils/navigator_utils.dart';
import 'package:flutter_app_study/redux/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../common/style/app_style.dart';
import 'package:redux/redux.dart';
import 'package:rive/rive.dart';

/**
 * 欢迎页
 */
class WelComePage extends StatefulWidget {
  static const String sName = "/";

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelComePage> {
  bool hadInit = false;
  String text = "";
  double fontSize = 20;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    Store<AppState> store = StoreProvider.of(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        text = "Welcome";
        fontSize = 30;
      });
    });
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        text = "FlutterApp";
        fontSize = 40;
      });
    });

    /// 2秒后跳转到主页
    Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
      //NavigatorUtils.goHome(context);
      NavigatorUtils.goLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
      builder: (context, store) {
        double size = 200;
        return Material(
          child: Container(
            color: APPColors.white,
            child: Stack(
              children: <Widget>[
                const Center(
                  child: Image(image: AssetImage('static/images/welcome.png')),
                ),
                Align(
                    alignment: const Alignment(0, 0.2),
                    child: Text(
                      text,
                      style: TextStyle(
                        color: APPColors.primaryDarkValue,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Align(
                  alignment: Alignment(0, 0.8),
                  child: Text("Mole"),
                ),
                Align(
                  alignment: const Alignment(0.0, 0.9),
                  child: SizedBox(
                    width: size,
                    height: size,
                    child: RiveAnimation.asset(
                      'static/file/launch.riv',
                      animations: const ["lookUp"],
                      onInit: (arb) {
                        var controller =
                            StateMachineController.fromArtboard(arb, "birb");
                        var smi = controller?.findInput<bool>("dance");
                        arb.addController(controller!);
                        smi?.value == true;
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
