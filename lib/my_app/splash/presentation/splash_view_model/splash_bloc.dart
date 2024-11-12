part of '../../splash_screen.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashBaseRepository _baseRepository;

  SplashBloc(
    this._baseRepository,
  ) : super(const SplashState()) {
    on<IsAlreadyAuthenticatedEvent>(
        (IsAlreadyAuthenticatedEvent event, Emitter<SplashState> emit) async {
      final result = await _baseRepository.isAlreadyAuthenticated();
      result.fold(
        (l) => emit(
          state.copyWith(isAlreadyAuthenticated: false),
        ),
        (r) => emit(
          state.copyWith(isAlreadyAuthenticated: r),
        ),
      );
    });
  }
}
