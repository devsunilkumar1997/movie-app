import 'package:dartz/dartz.dart';


import '../app_error.dart';
import '../movie_entity.dart';
import '../no_params.dart';
import '../repository/movie_repository.dart';
import 'usecase.dart';

class GetPlayingNow extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPlayingNow(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPlayingNow();
  }
}
