import 'package:dio/dio.dart';
import 'package:remote_request/remote_request.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers = Request.dioHeader;
    super.onRequest(options, handler);
  }

  final _cache = <Uri, Response>{};

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _cache[response.realUri] = response;
    super.onResponse(response, handler);
  }
}
