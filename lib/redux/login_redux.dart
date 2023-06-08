


import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

final LoginReducer = combineReducers<bool?>([
  TypedReducer<bool?, LoginSuccessAction>(_loginResult),
  TypedReducer<bool?, LogoutAction>(_loginResult),
]);



bool? _loginResult(bool? loginSuccess, action){
  if(action.success == true){

  }
  return action.success;
}


class LoginSuccessAction{
  final BuildContext? context;
  final bool? success;
  LoginSuccessAction(this.context, this.success);
}


class LogoutAction{
  final BuildContext? context;
  LogoutAction(this.context);
}


class LoginAction{
  final BuildContext? context;
  final String? username;
  final String? password;
  LoginAction(this.context, this.username, this.password);
}


class OAuthAction{
  final BuildContext? context;
  final String? code;
  OAuthAction(this.context, this.code);
}

