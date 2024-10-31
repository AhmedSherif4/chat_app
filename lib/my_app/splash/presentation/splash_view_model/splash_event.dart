part of '../../splash_screen.dart';


abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class CheckUserTokenEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}

// class CheckDevice extends SplashEvent {
//   @override
//   List<Object?> get props => [];
// }


class EditUserDataEvent extends SplashEvent {
  @override
  List<Object?> get props => [];
}