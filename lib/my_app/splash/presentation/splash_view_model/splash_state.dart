part of '../../splash_screen.dart';

class SplashState extends Equatable {
  final bool? isAlreadyAuthenticated;

  const SplashState({
    this.isAlreadyAuthenticated,
  });

  SplashState copyWith({
    bool? isAlreadyAuthenticated,
  }) {
    return SplashState(
      isAlreadyAuthenticated:
          isAlreadyAuthenticated ?? this.isAlreadyAuthenticated,
    );
  }

  @override
  List<Object?> get props => [
        isAlreadyAuthenticated,
      ];
}
