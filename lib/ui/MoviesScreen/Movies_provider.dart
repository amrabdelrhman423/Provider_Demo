import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/models/Movies.dart';
import 'package:flutter_day2_demo/repositories/Movie_repository.dart';

class Moviesprovider extends ChangeNotifier {
  List<Results> result;

  MovieRepository _movieRepository = MovieRepository();

  Moviesprovider() {
    getMoviess();
  }
  void getMoviess() {
    _movieRepository.fetchPosts().then((newmoviess) {
      result = newmoviess;
      notifyListeners();
    });
  }
}
