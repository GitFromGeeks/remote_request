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


// CustomInterceptor Documentation
// Overview
// CustomInterceptor is a custom implementation of the Interceptor class provided by the Dio package in Flutter. It overrides the onRequest and onResponse methods to modify request headers and cache responses, respectively.

// Features
// Header Modification: Automatically sets the request headers using a predefined static variable.
// Response Caching: Caches responses based on their URIs.
// Usage
// To use the CustomInterceptor, you need to add it to the Dio instance's interceptors. This is typically done during the setup of the Dio instance.

// dart
// Copy code
// import 'package:dio/dio.dart';
// import 'path/to/custom_interceptor.dart';

// void main() {
//   final dio = Dio();
//   dio.interceptors.add(CustomInterceptor());
  
//   // Now you can make requests with dio
// }
// Implementation Details
// Constructor
// The CustomInterceptor does not have a custom constructor and relies on the default constructor.

// dart
// Copy code
// CustomInterceptor();
// onRequest
// The onRequest method is called before a request is sent. It sets the request headers from a static variable Request.dioHeader.

// Parameters:
// RequestOptions options: The request options, which include the headers, method, path, etc.
// RequestInterceptorHandler handler: The handler to pass the request to the next interceptor or to proceed with the request.
// Example:
// dart
// Copy code
// @override
// void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//   options.headers = Request.dioHeader;
//   super.onRequest(options, handler);
// }
// onResponse
// The onResponse method is called when a response is received. It caches the response based on its URI.

// Parameters:
// Response response: The response object containing data, headers, etc.
// ResponseInterceptorHandler handler: The handler to pass the response to the next interceptor or to complete the request cycle.
// Example:
// dart
// Copy code
// final _cache = <Uri, Response>{};

// @override
// void onResponse(Response response, ResponseInterceptorHandler handler) {
//   _cache[response.realUri] = response;
//   super.onResponse(response, handler);
// }
// Caching
// The _cache variable is a private map that stores responses keyed by their URI. This cache can be used to retrieve responses without making network requests again.

// Complete Code
// Here is the complete implementation of the CustomInterceptor class:

// dart
// Copy code
// import 'package:dio/dio.dart';

// class CustomInterceptor extends Interceptor {
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     options.headers = Request.dioHeader;
//     super.onRequest(options, handler);
//   }

//   final _cache = <Uri, Response>{};

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     _cache[response.realUri] = response;
//     super.onResponse(response, handler);
//   }
// }
// Notes
// Ensure Request.dioHeader is properly defined and accessible.
// The current implementation does not handle cache expiration or invalidation. Depending on your use case, you might want to add mechanisms for cache management.
// The CustomInterceptor can be extended further to include more complex logic for request and response handling as needed.
// By using this interceptor, you can easily manage request headers and implement a basic caching mechanism for your network responses.