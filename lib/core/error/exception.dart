abstract class AppException implements Exception {
  final String errorMessage;

  AppException({required this.errorMessage});
}

class ServerException extends AppException {
  ServerException({required super.errorMessage});
}

class CacheException extends AppException {
  CacheException({required super.errorMessage});
}

class DatabaseException extends AppException {
  DatabaseException({required super.errorMessage});
}
