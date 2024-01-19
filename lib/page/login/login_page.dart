import 'package:flutter/material.dart';
import 'package:flutter_app_study/common/localizations/default_localizations.dart';
import 'package:flutter_app_study/common/style/app_style.dart';
import 'package:flutter_app_study/widget/particles/particles_widget.dart';
import '../../widget/input_widget.dart';
import '../../widget/flex_button.dart';
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
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: <Widget>[
              Positioned.fill(child: AnimatedBackground()),
              Positioned.fill(child: ParticleWidget(30)),
              Center(
                // 防止overFlow的现象
                child: SafeArea(
                  // 同时弹出键盘不遮挡
                  child: SingleChildScrollView(
                    child: Card(
                      elevation: 5.0,
                      //设置阴影
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Padding(
                        padding: new EdgeInsets.only(
                            left: 30.0, top: 40.0, right: 30.0, bottom: 0.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image(
                              image: new AssetImage(APPICons.DEFAULT_USER_ICON),
                              width: 90,
                              height: 90,
                            ),
                            new Padding(padding: new EdgeInsets.all(10.0)),
                            new InputWidget(
                              hintText: AppLocalizations.i18n(context)!
                                  .login_username_hint_text,
                              iconData: APPICons.LOGIN_USER,
                              onChanged: (String value) {
                                //_userName = value;
                              },
                              controller: TextEditingController(),
                            ),
                            new Padding(padding: new EdgeInsets.all(10.0)),
                            new InputWidget(
                              hintText: AppLocalizations.i18n(context)!
                                  .login_password_hint_text,
                              iconData: APPICons.LOGIN_PW,
                              onChanged: (String value) {
                                //_password = value;
                              },
                              controller: TextEditingController(),
                              obscureText: true,
                            ),
                            new Padding(padding: new EdgeInsets.all(10.0)),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  new Expanded(
                                      child: new FlexButton(
                                        text: AppLocalizations.i18n(context)!
                                            .login_text,
                                        color: Theme.of(context).primaryColor,
                                        textColor: APPColors.textWhite,
                                        fontSize: 16,
                                        onPress: () {},
                                      )),
                                  new SizedBox(
                                    width: 10,
                                  ),
                                  new Expanded(
                                      child: new FlexButton(
                                        text: AppLocalizations.i18n(context)!
                                            .oauth_text,
                                        color: Theme.of(context).primaryColor,
                                        textColor: APPColors.textWhite,
                                        fontSize: 16,
                                        onPress: () {},
                                      ))
                                ],
                              ),
                            ),
                            new Padding(padding: new EdgeInsets.all(15.0)),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                AppLocalizations.i18n(context)!.switch_language,
                                style: TextStyle(
                                  color: APPColors.subTextColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
