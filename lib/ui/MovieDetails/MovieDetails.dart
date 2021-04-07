import 'package:flutter/material.dart';
import 'package:flutter_day2_demo/ui/MovieDetails/MoviesDetailsProvider.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  String id;

  MovieDetails(this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movie"),
        ),
        body: ChangeNotifierProvider<MovieDtailsProvider>(
          create: (context) => MovieDtailsProvider(id),
          child: Consumer<MovieDtailsProvider>(
            builder: (context, movieDetailsprovider, _) {
              if (movieDetailsprovider.result != null) {
                return Column(
                  children: [
                    Hero(
                      tag: "https://image.tmdb.org/t/p/w500" +
                          movieDetailsprovider.result.backdropPath,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  movieDetailsprovider.result.backdropPath),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(movieDetailsprovider.result.title),
                            subtitle: Text(movieDetailsprovider
                                .result.releaseDate
                                .toString()),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(movieDetailsprovider.result.overview),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
