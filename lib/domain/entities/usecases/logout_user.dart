import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/app_error.dart';

import '../no_params.dart';
import '../repository/authentication_repository.dart';
import 'usecase.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams noParams) async =>
      _authenticationRepository.logoutUser();
}
