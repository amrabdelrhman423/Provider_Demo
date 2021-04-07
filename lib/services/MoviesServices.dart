import 'dart:convert';

import 'package:flutter_day2_demo/models/Movies.dart';
import 'package:http/http.dart' as http;

class MoviesService {
  Future<List<Results>> fetchPosts() async {
    final response = await http.get(
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc');
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      // return (json.decode(response.body) as List).map((e) => Post.fromJson(e)).toList();
      Movies movies = Movies.fromJson(json.decode(response.body));
      return List<Results>.from(movies.results);
    } else {
      throw Exception('FAILED TO LOAD POST');
    }
  }
}
