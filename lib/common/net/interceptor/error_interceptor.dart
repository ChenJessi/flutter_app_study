
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_app_study/common/net/result_data.dart';
import 'package:flutter_app_study/common/net/code.dart';

class ErrorInterceptors extends InterceptorsWrapper {


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if(connectivityResult == ConnectivityResult.none){
      return handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.unknown,
          response: Response(
            requestOptions: options,
              data:ResultData(
                  Code.errorHandleFunction(Code.NETWORK_ERROR, "", false),
                  false,
                  Code.NETWORK_ERROR
              )
          )
      ));
    }

    return super.onRequest(options, handler);
  }

}