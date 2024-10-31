import 'package:equatable/equatable.dart';

class AppTimeData extends Equatable {
  static DateTime startTime = DateTime.now();
  static DateTime endTime = DateTime.now();

  static void setStartTime(DateTime value) => startTime = value;

  static DateTime startTimeGetter() => startTime;

  static void setEndTime(DateTime value) => endTime = value;

  static DateTime endTimeGetter() => endTime;

  @override
  List<Object?> get props => [
        startTime,
        endTime,
      ];
}



