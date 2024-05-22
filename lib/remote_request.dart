library remote_request;

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:remote_request/custom_interceptor.dart';
import 'package:remote_request/exceptions.dart';

class Request {
  Request();

  static final Dio basicDio = Dio(BaseOptions(headers: {
    'Content-Type': 'application/json',
  }));

  static Map<String, dynamic> dioHeader = {};

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
    ),
  )..interceptors.add(
      CustomInterceptor(),
    );

  static void setBaseUrl({required String baseUrl}) =>
      _dio.options.baseUrl = baseUrl;

  static void setHeader({required Map<String, dynamic> header}) =>
      dioHeader = header;

  // ------------------------------- GET -------------------------------  ||
  static Future<Response?> get(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response? response;
    try {
      response = await _dio.get(
        endPoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw await throwException(e);
    }
    return response;
  }

  // ------------------------------- POST ------------------------------- ||

  static Future<Response?> post(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response? response;
    try {
      response = await _dio.post(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw await throwException(e);
    }
    return response;
  }

  // ------------------------------- PATCH ------------------------------- ||

  static Future<Response?> patch(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response? response;
    try {
      response = await _dio.patch(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw await throwException(e);
    }
    return response;
  }

  // ------------------------------- PUT ------------------------------- ||

  static Future<Response?> put(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    Response? response;
    try {
      response = await _dio.put(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException catch (e) {
      throw await throwException(e);
    }
    return response;
  }

  // ------------------------------- DELETE ------------------------------- ||

  static Future<Response?> delete(
    String endPoint, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // Response? response;
    try {
      final Response response = await _dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw await throwException(e);
    }
  }

  static Future<Exception> throwException(DioException e) async {
    log("Status Code of Error: ${e.response?.statusCode}");
    if (e.response?.statusCode == 400) {
      throw BadRequestException();
    } else if (e.response?.statusCode == 401) {
      throw AuthException();
    } else if (e.response?.statusCode == 403) {
      throw ForbiddenException();
    } else if (e.response?.statusCode == 404) {
      throw NotFoundException();
    } else if (e.response?.statusCode == 405) {
      throw MethodNotAllowedException();
    } else if (e.response?.statusCode == 500) {
      throw InternalServerException();
    } else if (e.response?.statusCode == 502) {
      throw BadGatewayException();
    } else if (e.response?.statusCode == 503) {
      throw ServerUnAvailableException();
    } else if (e.response?.statusCode == 504) {
      throw GatewayTimeoutException();
    } else {
      throw UnKnownDioException();
    }
  }

  static Future<Exception> throwExceptionFromStatusCode(int statusCode) async {
    log("Status Code of Error: $statusCode");
    if (statusCode == 400) {
      throw BadRequestException();
    } else if (statusCode == 401) {
      throw AuthException();
    } else if (statusCode == 403) {
      throw ForbiddenException();
    } else if (statusCode == 404) {
      throw NotFoundException();
    } else if (statusCode == 405) {
      throw MethodNotAllowedException();
    } else if (statusCode == 500) {
      throw InternalServerException();
    } else if (statusCode == 502) {
      throw BadGatewayException();
    } else if (statusCode == 503) {
      throw ServerUnAvailableException();
    } else if (statusCode == 504) {
      throw GatewayTimeoutException();
    } else {
      throw UnKnownDioException();
    }
  }
}
