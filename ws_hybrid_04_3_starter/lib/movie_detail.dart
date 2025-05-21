import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {

  final Movie movie;
  final String imgPath='https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path= imgPath + movie.posterPath!;
    }else {
      path = 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
        ),
        //body에 이미지, 영화에 대한 전반적 리뷰를 표출한다.
        body: SingleChildScrollView(child: Center(child:Column(
          children: <Widget>[
            // 코드를 구현하세요 ~~~~~~~





            ],
        ))));
  }
}
