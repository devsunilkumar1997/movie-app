import 'package:dartz/dartz.dart';

import '../app_error.dart';
import '../movie_entity.dart';
import '../movie_search_params.dart';
import '../repository/movie_repository.dart';
import 'usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams searchParams) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}