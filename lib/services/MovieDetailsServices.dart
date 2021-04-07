import 'package:flutter_day2_demo/models/MovieDetails.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieDetailsServices {
  String id;
  MovieDetailsServices(this.id);

  Future<Movie> fetchMovie() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US"));
    if (response.statusCode == 200) {
      print(response.body);
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('FAILED TO LOAD MOVIES');
    }
  }
}
