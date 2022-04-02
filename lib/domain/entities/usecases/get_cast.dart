import 'package:dartz/dartz.dart';

import '../app_error.dart';
import '../cast_entity.dart';
import '../movie_params.dart';
import '../repository/movie_repository.dart';
import 'usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams movieParams) async {
    return await repository.getCastCrew(movieParams.id);
  }
}
