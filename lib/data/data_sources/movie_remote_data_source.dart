// import 'dart:convert';
// import 'dart:html';

// import 'package:movieapp/data/models/movie_result_model.dart';
// import 'package:movieapp/data/models/movie_model.dart';

// import '../core/api_client.dart';
// import '../core/api_constant.dart';

// abstract class MovieRemoteDataSource {
//   Future<List<MovieModel>> getTrending();
// }

// class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
//   final ApiClient _client;
//   MovieRemoteDataSourceImpl(this._client);
//   @override
//   Future<List<MovieModel>> getTrending() async {
//     final response = await _client.get(
//       '${ApiConstant.BASE_URL}trending/movie/day?api_key=${ApiConstant.API_KEY}',
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 200) {
//       final responseBody = json.decode(response.body);
//       final movies = MoviesResultModel.fromJson(responseBody).movies;
//       print(movies);
//       return movies;
//     } else {
//       throw Exception(response.reasonPhrase);
//     }
//   }
// }
import '../core/api_client.dart';

import '../models/cast_crew_result_model.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movie_result_model.dart';

import '../models/video_model.dart';
import '../models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day', headers: {});
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular', headers: {});
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming', headers: {});
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing', headers: {});
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id', headers: {});
    final movie = MovieDetailModel.fromJson(response);
    if (_isValidMovieDetail(movie)) {
      return movie;
    }
    throw Exception();
  }

  bool _isValidMovieDetail(MovieDetailModel movie) {
    return movie.id != -1 &&
        movie.title.isNotEmpty &&
        movie.posterPath.isNotEmpty;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits', headers: {});
    final cast = CastCrewResultModel.fromJson(response).cast;
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos', headers: {});
    final videos = VideoResultModel.fromJson(response).videos;
    return videos;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final response = await _client.get('search/movie', params: {
      'query': searchTerm,
    }, headers: {});
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}
