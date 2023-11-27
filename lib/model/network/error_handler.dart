class ServerException implements Exception {
  final int code;
  final String message;
  // final int success;

  ServerException({
    // required this.success,
    required this.code,
    required this.message,
  });
}
