import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;
  final String functionName;

  const Failure({
    required this.errorMessage,
    required this.functionName,
  });

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.errorMessage,
    required super.functionName,
  });

  @override
  List<Object?> get props => [errorMessage];
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.errorMessage,
    required super.functionName,
  });
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.errorMessage,
    required super.functionName,
  });
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    required super.errorMessage,
    required super.functionName,
  });
}
