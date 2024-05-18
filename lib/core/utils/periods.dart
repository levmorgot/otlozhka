import 'package:otlozhka/core/utils/app_logger.dart';
import 'package:otlozhka/core/utils/extensoins.dart';
import 'package:otlozhka/features/transactions/domain/usecases/params/period_params.dart';

PeriodParams oneDay() {
  final now = DateTime.now().trim();
  final tomorrow = now.add(const Duration(days: 1));
  log(PeriodParams(start: now, end: now));
  return PeriodParams(start: now, end: tomorrow);
}

PeriodParams oneWeek() {
  final now = DateTime.now().trim();
  final lastMonday = now.subtract(Duration(days: now.weekday - 1));
  final nextMonday = lastMonday.add(const Duration(days: 7));
  log(PeriodParams(start: lastMonday, end: nextMonday));
  return PeriodParams(start: lastMonday, end: nextMonday);
}

PeriodParams oneMonth() {
  final now = DateTime.now().trim();
  final startMonth = DateTime(now.year, now.month, 1);
  final nextMonth = now.month == 12 ? 1 : (now.month + 1);
  final year = nextMonth == 1 ? (now.year + 1) : now.year;
  final startNextMonth = DateTime(year, nextMonth, 1);
  log(PeriodParams(start: startMonth, end: startNextMonth));
  return PeriodParams(start: startMonth, end: startNextMonth);
}

PeriodParams oneYear() {
  final now = DateTime.now().trim();
  log(PeriodParams(start: DateTime(now.year), end: DateTime(now.year + 1)));
  return PeriodParams(start: DateTime(now.year), end: DateTime(now.year + 1));
}
