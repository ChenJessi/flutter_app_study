import 'package:dio/dio.dart';
import 'package:flutter_app_study/common/net/result_data.dart';

import '../code.dart';


class ResponseInterceptors extends InterceptorsWrapper{

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    RequestOptions options = response.requestOptions;
    var value;
    try {
      var header = options.headers[Headers.contentTypeHeader];
      if(header != null && header.toString().contains("text")){
        value = ResultData(response.data, true, Code.SUCCESS);
      }else if(response.statusCode! >=200 && response.statusCode! < 300){
        value = ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + options.path);
      value = ResultData(response.data, false, response.statusCode, headers: response.headers);
    }
    response.data = value;
    return handler.next(response);
  }
}