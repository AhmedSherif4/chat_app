import 'package:chat/features/login/login.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/base_usecase.dart';

@LazySingleton()
class LoginUseCase extends BaseUseCase<void, String> {
  final LoginBaseRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(String parameter) async {
    return await repository.getCodeWithPhoneNumber(parameter);
  }
}
