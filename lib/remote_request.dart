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




// Remote Request Service Library Documentation
// This documentation provides an overview of the remote_request service library, which leverages the Dio package for handling HTTP requests in a Flutter application. It includes a custom interceptor for request modification and caching, as well as custom exceptions for structured error handling.

// Library Overview
// The remote_request library provides a centralized service for making HTTP requests with Dio. It includes methods for common HTTP operations (GET, POST, PATCH, PUT, DELETE) and a mechanism for setting headers and the base URL dynamically. The library also includes a custom interceptor and a set of custom exceptions to handle specific error scenarios.

// Classes
// Request
// The Request class provides static methods for making HTTP requests. It includes methods for setting headers and the base URL, and it handles different HTTP operations.

// Constructor
// The Request class has a default constructor, but it is not intended to be instantiated since all methods and properties are static.

// dart
// Copy code
// Request();
// Properties
// basicDio: A basic Dio instance with default JSON headers.
// dioHeader: A static map for storing custom headers.
// _dio: A Dio instance with a custom interceptor and default options.
// Methods
// setBaseUrl
// Sets the base URL for the Dio instance.

// dart
// Copy code
// static void setBaseUrl({required String baseUrl}) =>
//     _dio.options.baseUrl = baseUrl;
// setHeader
// Sets custom headers for the Dio instance.

// dart
// Copy code
// static void setHeader({required Map<String, dynamic> header}) =>
//     dioHeader = header;
// get
// Performs a GET request.

// dart
// Copy code
// static Future<Response?> get(
//   String endPoint, {
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
//   ProgressCallback? onReceiveProgress,
// }) async {
//   // Implementation
// }
// post
// Performs a POST request.

// dart
// Copy code
// static Future<Response?> post(
//   String endPoint, {
//   data,
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
//   ProgressCallback? onSendProgress,
//   ProgressCallback? onReceiveProgress,
// }) async {
//   // Implementation
// }
// patch
// Performs a PATCH request.

// dart
// Copy code
// static Future<Response?> patch(
//   String endPoint, {
//   data,
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
//   ProgressCallback? onSendProgress,
//   ProgressCallback? onReceiveProgress,
// }) async {
//   // Implementation
// }
// put
// Performs a PUT request.

// dart
// Copy code
// static Future<Response?> put(
//   String endPoint, {
//   data,
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
//   ProgressCallback? onSendProgress,
//   ProgressCallback? onReceiveProgress,
// }) async {
//   // Implementation
// }
// delete
// Performs a DELETE request.

// dart
// Copy code
// static Future<Response?> delete(
//   String endPoint, {
//   data,
//   Map<String, dynamic>? queryParameters,
//   Options? options,
//   CancelToken? cancelToken,
// }) async {
//   // Implementation
// }
// throwException
// Throws custom exceptions based on Dio error responses.

// dart
// Copy code
// static Future<Exception> throwException(DioException e) async {
//   // Implementation
// }
// throwExceptionFromStatusCode
// Throws custom exceptions based on status codes.

// dart
// Copy code
// static Future<Exception> throwExceptionFromStatusCode(int statusCode) async {
//   // Implementation
// }
// Custom Interceptor
// CustomInterceptor
// The CustomInterceptor class extends the Dio Interceptor class to modify request headers and cache responses.

// Properties
// _cache: A private map to cache responses by URI.
// Methods
// onRequest
// Overrides the onRequest method to set request headers from Request.dioHeader.

// dart
// Copy code
// @override
// void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//   options.headers = Request.dioHeader;
//   super.onRequest(options, handler);
// }
// onResponse
// Overrides the onResponse method to cache responses.

// dart
// Copy code
// @override
// void onResponse(Response response, ResponseInterceptorHandler handler) {
//   _cache[response.realUri] = response;
//   super.onResponse(response, handler);
// }
// Custom Exceptions
// The library includes several custom exception classes to handle specific error scenarios. Each class implements the Exception interface.

// AuthException
// BadRequestException
// ForbiddenException
// NotFoundException
// InternalServerException
// ServerUnAvailableException
// GatewayTimeoutException
// BadGatewayException
// UnKnownException
// UnKnownDioException
// MethodNotAllowedException
// Usage Example
// Here is an example of how to use the Request class to make a GET request:

// dart
// Copy code
// import 'package:remote_request/remote_request.dart';

// void main() async {
//   Request.setBaseUrl(baseUrl: 'https://api.example.com');
//   Request.setHeader(header: {'Authorization': 'Bearer token'});

//   try {
//     final response = await Request.get('/endpoint');
//     print(response?.data);
//   } catch (e) {
//     if (e is BadRequestException) {
//       print('Bad request');
//     } else {
//       print('Unknown error: $e');
//     }
//   }
// }
// This example sets the base URL and headers, performs a GET request, and handles potential errors using the custom exceptions.