import 'package:dartz/dartz.dart';

import '../app_error.dart';
import '../login_request_param.dart';
import '../repository/authentication_repository.dart';
import 'usecase.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}