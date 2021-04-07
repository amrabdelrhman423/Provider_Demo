import 'package:flutter_day2_demo/models/MovieDetails.dart';
import 'package:flutter_day2_demo/models/Movies.dart';
import 'package:flutter_day2_demo/services/MovieDetailsServices.dart';
import 'package:flutter_day2_demo/services/MoviesServices.dart';

class MovieRepository {
  MoviesService _MoviesService = MoviesService();

  Future<List<Results>> fetchPosts() {
    return _MoviesService.fetchPosts();
  }

  Future<Movie> fetchMovie(String id) {
    return MovieDetailsServices(id).fetchMovie();
  }
}
