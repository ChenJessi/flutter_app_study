import 'dart:collection';
import 'package:dio/dio.dart';
import 'package:flutter_app_study/common/net/interceptor/token_interceptor.dart';
import 'result_data.dart';
import 'code.dart';

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  final Dio _dio = Dio(); // 使用默认配置

  final TokenInterceptor _tokenInterceptor = TokenInterceptor();

  HttpManager() {
    _dio.interceptors.add(_tokenInterceptor);
  }

  /// 发起网络请求
  /// [url] 请求url
  /// [params] 请求参数
  /// [header] 请求头
  /// [options] 请求配置
  /// [noTip] 是否需要loading
  Future<ResultData> netFetch(
    String url,
    params,
    Map<String, dynamic>? header,
    Options? options,
  ) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if(options != null) {
      options.headers = headers;
    }else {
      options = Options(method: 'get');
      options.headers = headers;
    }

    resultError(DioException e){
      Response? errorResponse;
      if(e.response != null) {
        errorResponse = e.response;
      }else {
        errorResponse = Response(statusCode: 666, requestOptions: RequestOptions(path: url));
      }

      if(e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
        errorResponse?.statusCode = Code.NETWORK_TIMEOUT;
      }

      return ResultData(
        Code.errorHandleFunction(errorResponse!.statusCode, e.message, false),
        false,
        errorResponse!.statusCode,
      );
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: options);
    } on DioException catch (e) {
      print(e);
      return resultError(e);
    }

    if(response.data is DioException){
      return resultError(response.data);
    }
    return response.data;
  }


  ///清除授权
  clearAuthorization(){
    _tokenInterceptor.clearAuthorization();
  }

  /// 获取授权token
  getAuthorization() async {
    return _tokenInterceptor.getAuthorization();
  }


  final HttpManager httpManager = HttpManager();
}
