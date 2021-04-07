import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/ui/MovieDetails/MovieDetails.dart';
import 'package:flutter_day2_demo/ui/MoviesScreen/Movies_provider.dart';
import 'package:flutter_day2_demo/widgets/Movie_widget.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  final String title;

  MoviesScreen({this.title});

  @override
  _MoviesScreenState createState() => _MoviesScreenState(title);
}

class _MoviesScreenState extends State<MoviesScreen> {
  final String title;

  _MoviesScreenState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ChangeNotifierProvider<Moviesprovider>(
          create: (context) => Moviesprovider(),
          child: Consumer<Moviesprovider>(
            builder: (buildContext, moviesProvider, _) {
              if (moviesProvider.result == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                _selecteditem() {}
                return ListView.builder(
                  itemCount: moviesProvider.result.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MovieDetails(
                            (moviesProvider.result[index].id).toString());
                      }));
                    },
                    child: MovieItem(_selecteditem(),
                        image: "https://image.tmdb.org/t/p/w500" +
                            moviesProvider.result[index].backdropPath,
                        titel: moviesProvider.result[index].originalTitle,
                        releaseYear: moviesProvider.result[index].releaseDate,
                        voderate: moviesProvider.result[index].voteAverage),
                  ),
                );
              }
            },
          ),
        ));
  }
}
