
import 'package:dio/dio.dart';
import 'package:flutter_app_study/common/config/config.dart';

/// 日志拦截器
class LogInterceptor extends InterceptorsWrapper{
    static List<Map?> sHttpResponses = [];
    static List<String?> sResponsesHttpUrl = [];


    static List<Map<String, dynamic>?> sHttpRequests = [];
    static List<String?> sRequestHttpUrl = [];

    static List<Map<String, dynamic>?> sHttpError = [];
    static List<String?> sHttpErrorUrl = [];


    @override
    void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
        if(Config.DEBUG){
            print("请求url：${options.path}  ${options.method}");
            options.headers.forEach((key, value) { options.headers[key] = value ?? "";});
            print("请求头：${options.headers}");
            if(options.data != null){
                print("请求参数：${options.data}");
            }
        }

        try {
          addLogic(sRequestHttpUrl , options.path);
          var data;
          if(options.data is Map){
            data = options.data;
          }else {
            data = <String, dynamic>{};
          }
          var map = {
            "header": {...options.headers},
          };
          if(options.method == "POST"){
            map["data"] = data;
          }
          addLogic(sHttpRequests, map);

        } catch (e) {
          print(e);
        }

        super.onRequest(options, handler);
    }

    @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if(Config.DEBUG){
      print("返回参数：${response.data}");
    }

    if(response.data is List || response.data is Map || response.data is String){
      try {
        var data = <String, dynamic>{};
        data["data"] = response.data;
        addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
        addLogic(sHttpResponses, data);
      } catch (e) {
        print(e);
      }
    }
    // switch(response.data) {
    //   case  List || Map:
    //     {
    //         try {
    //           var data = <String, dynamic>{};
    //           data["data"] = response.data;
    //           addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
    //           addLogic(sHttpResponses, data);
    //         } catch (e) {
    //           print(e);
    //         }
    //     }
    //     break;
    //   case String:
    //     {
    //       try {
    //         var data = <String, dynamic>{};
    //         data["data"] = response.data;
    //         addLogic(sResponsesHttpUrl, response.requestOptions.uri.toString());
    //         addLogic(sHttpResponses, data);
    //       } catch (e) {
    //         print(e);
    //       }
    //     }
    //   break;
    // }

    super.onResponse(response, handler);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }




    static addLogic(List list, data){
      if (list.length > 20) {
        list.removeAt(0);
      }
      list.add(data);
    }

}