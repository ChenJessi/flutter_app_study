
import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.connectTimeout = const Duration(seconds: 30);
    options.receiveTimeout = const Duration(seconds: 30);
    super.onRequest(options, handler);
  }
}