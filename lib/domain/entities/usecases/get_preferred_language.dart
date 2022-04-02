import 'package:dartz/dartz.dart';

import '../app_error.dart';
import '../no_params.dart';
import '../repository/app_repository.dart';
import 'usecase.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository appRepository;

  GetPreferredLanguage(this.appRepository);

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await appRepository.getPreferredLanguage();
  }
}