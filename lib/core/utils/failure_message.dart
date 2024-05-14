import 'package:otlozhka/core/error/failure.dart';
import 'package:otlozhka/core/utils/app_logger.dart';

String mapFailureMessage(Failure failure) {
  log('${failure.errorMessage} in ${failure.functionName} function');

  return '${failure.runtimeType} ${failure.errorMessage} in ${failure.functionName} function';
}