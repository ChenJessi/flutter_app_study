


import 'package:flutter/material.dart';
import 'package:redux/redux.dart';



final ThemeDataReducer = combineReducers<ThemeData?>([
  TypedReducer<ThemeData?, RefreshThemeDataAction>(_refreshThemeData),
]);

ThemeData? _refreshThemeData(ThemeData? themeData, action){
  themeData = action.themeData;
  return themeData;
}

class RefreshThemeDataAction{
  ThemeData? themeData;
  RefreshThemeDataAction(this.themeData);
}