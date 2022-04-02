import 'package:dartz/dartz.dart';
import 'package:movieapp/domain/entities/no_params.dart';

import '../app_error.dart';



import '../movie_entity.dart';

import '../repository/movie_repository.dart';
import 'usecase.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
