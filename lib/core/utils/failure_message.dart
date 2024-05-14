import 'package:otlozhka/core/error/failure.dart';

String mapFailureMessage(Failure failure) {
  print('${failure.errorMessage} in ${failure.functionName} function');

  return '${failure.runtimeType} ${failure.errorMessage} in ${failure.functionName} function';
}