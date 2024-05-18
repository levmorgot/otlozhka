import 'package:equatable/equatable.dart';

class PeriodParams extends Equatable {
  final DateTime start;
  final DateTime end;

  const PeriodParams({
    required this.start,
    required this.end,
  });

  @override
  List<Object?> get props => [
        start,
        end,
      ];
}
