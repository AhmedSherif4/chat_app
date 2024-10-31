import 'package:equatable/equatable.dart';

abstract class GlobalEvent extends Equatable {
  const GlobalEvent();
}

class SendTimeInAppEvent extends GlobalEvent {
  const SendTimeInAppEvent();

  @override
  List<Object> get props => [];
}

class StartTimeSet extends GlobalEvent {
  const StartTimeSet();

  @override
  List<Object?> get props => [];
}

class GetGuestDataEvent extends GlobalEvent{
  @override
  List<Object?> get props => [];
}

class GetInfoDataEvent extends GlobalEvent{
  @override
  List<Object?> get props => [];
}


class CheckAppVersionEvent extends GlobalEvent {
  @override
  List<Object?> get props => [];
}


