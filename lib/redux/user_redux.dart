
import 'package:redux/redux.dart';
import '../model/User.dart';



/// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User?>([
  TypedReducer<User?, UpdateUserAction>(_updateLoaded),
]);

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 方法返回新的 User
User? _updateLoaded(User? user, action){
  user = action.user;
  return user;
}


/// 定义一个 UpdateUserAction , 用于发起更新用户信息的 action
/// 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
class UpdateUserAction{
  User user;
  UpdateUserAction(this.user);
}