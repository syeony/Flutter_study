import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath!;
    } else {
      path =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Image.network(path, height: height * 0.5, fit: BoxFit.cover),
                    SizedBox(height: 20),
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text('개봉일: ${movie.releaseDate}'),
                    Text('평점: ${movie.voteAverage}'),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        movie.overview,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ))));
  }
}
