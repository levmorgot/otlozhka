import 'package:logger/logger.dart';

var logger = Logger();

void log(Object message) {
  logger.d(message);
}
