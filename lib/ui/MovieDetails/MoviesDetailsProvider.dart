import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/models/MovieDetails.dart';
import 'package:flutter_day2_demo/repositories/Movie_repository.dart';
import 'package:provider/provider.dart';

class MovieDtailsProvider extends ChangeNotifier {
  MovieRepository _movieRepository = MovieRepository();

  Movie result;
  String id;

  MovieDtailsProvider(this.id) {
    getMovieDetails(id);
  }

  void getMovieDetails(String id) {
    _movieRepository.fetchMovie(id).then((newmovie) {
      result = newmovie;
      notifyListeners();
    });
  }
}
