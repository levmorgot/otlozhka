import 'package:collection/collection.dart';

class EnumUtil {
  static String toJson(Object o) => o.toString().split('.').last;

  static String _toString(Object o) => o.toString().split('.').last.toLowerCase();

  static T fromString<T>(String key, List<T> values) => values.firstWhereOrNull((item) => key.toLowerCase() == _toString(item!)) ?? values.first;
}
