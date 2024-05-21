class AuthException implements Exception {}

class BadRequestException implements Exception {}

class ForbiddenException implements Exception {}

class NotFoundException implements Exception {}

class InternalServerException implements Exception {}

class ServerUnAvailableException implements Exception {}

class GatewayTimeoutException implements Exception {}

class BadGatewayException implements Exception {}

class UnKnownException implements Exception {}

class UnKnownDioException implements Exception {}

class MethodNotAllowedException implements Exception {}




// Custom Exception Classes Documentation
// This documentation provides an overview of the custom exception classes defined in your Flutter application. These exceptions can be used to handle specific error scenarios in a more structured and meaningful way.

// Exception Classes
// AuthException
// AuthException is used to indicate authentication-related errors.

// dart
// Copy code
// class AuthException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (!isAuthenticated) {
//   throw AuthException();
// }
// BadRequestException
// BadRequestException represents errors related to bad requests, typically corresponding to HTTP status code 400.

// dart
// Copy code
// class BadRequestException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 400) {
//   throw BadRequestException();
// }
// ForbiddenException
// ForbiddenException is used for errors indicating that the client does not have access rights to the content, typically corresponding to HTTP status code 403.

// dart
// Copy code
// class ForbiddenException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 403) {
//   throw ForbiddenException();
// }
// NotFoundException
// NotFoundException indicates that the requested resource was not found, corresponding to HTTP status code 404.

// dart
// Copy code
// class NotFoundException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 404) {
//   throw NotFoundException();
// }
// InternalServerException
// InternalServerException is used to indicate server errors, typically corresponding to HTTP status code 500.

// dart
// Copy code
// class InternalServerException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 500) {
//   throw InternalServerException();
// }
// ServerUnAvailableException
// ServerUnAvailableException indicates that the server is unavailable, typically corresponding to HTTP status code 503.

// dart
// Copy code
// class ServerUnAvailableException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 503) {
//   throw ServerUnAvailableException();
// }
// GatewayTimeoutException
// GatewayTimeoutException represents errors when the server, while acting as a gateway or proxy, did not receive a timely response, typically corresponding to HTTP status code 504.

// dart
// Copy code
// class GatewayTimeoutException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 504) {
//   throw GatewayTimeoutException();
// }
// BadGatewayException
// BadGatewayException is used to indicate that the server, while acting as a gateway or proxy, received an invalid response from the upstream server, typically corresponding to HTTP status code 502.

// dart
// Copy code
// class BadGatewayException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 502) {
//   throw BadGatewayException();
// }
// UnKnownException
// UnKnownException is a generic exception used when the error type is not known.

// dart
// Copy code
// class UnKnownException implements Exception {}
// Usage Example:
// dart
// Copy code
// throw UnKnownException();
// UnKnownDioException
// UnKnownDioException is a specific type of unknown exception related to Dio, a popular HTTP client for Dart and Flutter.

// dart
// Copy code
// class UnKnownDioException implements Exception {}
// Usage Example:
// dart
// Copy code
// try {
//   // some Dio operation
// } catch (e) {
//   throw UnKnownDioException();
// }
// MethodNotAllowedException
// MethodNotAllowedException indicates that the request method is not allowed, typically corresponding to HTTP status code 405.

// dart
// Copy code
// class MethodNotAllowedException implements Exception {}
// Usage Example:
// dart
// Copy code
// if (response.statusCode == 405) {
//   throw MethodNotAllowedException();
// }
// Handling Exceptions
// To handle these exceptions, you can use a try-catch block and catch specific exceptions to perform appropriate error handling.

// dart
// Copy code
// try {
//   // some code that may throw an exception
// } on AuthException {
//   // handle authentication error
// } on BadRequestException {
//   // handle bad request error
// } on NotFoundException {
//   // handle not found error
// } catch (e) {
//   // handle other exceptions
// }
// These custom exceptions provide a structured way to handle different error scenarios in your Flutter application, improving code readability and maintainability.