import 'package:dartz/dartz.dart';

import '../app_error.dart';
import '../movie_detail_entities.dart';
import '../movie_params.dart';
import '../repository/movie_repository.dart';
import 'usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}