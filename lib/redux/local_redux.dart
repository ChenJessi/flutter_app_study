



import 'dart:ui';
import 'package:redux/redux.dart';

/**
 * 语言 redux
 */

final LocalReducer = combineReducers<Locale?>([
  TypedReducer<Locale?, RefreshLocaleAction>(_refreshLocal),
]);


Locale? _refreshLocal(Locale? local, action){
  return action.local;
}

class RefreshLocaleAction{
  final Locale? local;
  RefreshLocaleAction(this.local);
}
