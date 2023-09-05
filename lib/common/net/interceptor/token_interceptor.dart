import 'package:dio/dio.dart';
import '../graphql/client.dart';
import '../../local/local_storage.dart';
import '../../config/config.dart';

class TokenInterceptor extends InterceptorsWrapper {

  String? _token;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if(_token == null){
      // 获取token
      var authorizationCode = await getAuthorization();
      if(authorizationCode != null){
        _token = authorizationCode;
        await initClient(_token);
      }
    }
    if(_token != null){
      options.headers["Authorization"] = _token;
    }
    super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      var responseJson = response.data;
      if(response.statusCode == 201 && responseJson["token"] != null){
            _token = "token ${responseJson["token"]}";
            await LocalStorage.save(Config.TOKEN_KEY, _token);
          }
    } catch (e) {
      print(e);
    }
    return super.onResponse(response, handler);
  }



  // 获取token
   getAuthorization() async {
    String? token = await LocalStorage.get(Config.TOKEN_KEY);
    if(token == null){
      String? basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if(basic == null){
          // 提示输入账号密码
      }else {
        // t通过 basic 获取token
        return "Basic $basic";
      }
    }else {
      _token = token;
      return token;
    }
  }

  clearAuthorization() {
    _token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
    releaseClient();
  }

}