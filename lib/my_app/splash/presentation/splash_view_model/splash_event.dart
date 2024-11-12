part of '../../splash_screen.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class IsAlreadyAuthenticatedEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}
