import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie_detail.dart';
import 'movie.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  late HttpHelper helper;
  int moviesCount = 0;
  List movies = [];

  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('SSAFY Movie');

  Future initialize() async {
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
      this.movies = movies;
    });
  }

  Future searchMovies(String keyword) async {
    List searchResults = await helper.searchMovies(keyword);
    setState(() {
      moviesCount = searchResults.length;
      this.movies = searchResults;
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: searchBar,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: <Widget>[
              IconButton(
                icon: visibleIcon,
                onPressed: () {
                  setState(() {
                    if (this.visibleIcon.icon == Icons.search) {
                      this.visibleIcon = Icon(Icons.cancel);
                      this.searchBar = TextField(
                        textInputAction: TextInputAction.search,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        onSubmitted: (String text) {
                          searchMovies(text);
                        },
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: '영화 제목 검색',
                          hintStyle: TextStyle(color: Colors.white60),
                          border: InputBorder.none,
                        ),
                      );
                    } else {
                      setState(() {
                        this.visibleIcon = Icon(Icons.search);
                        this.searchBar = Text('SSAFY Movie');
                        initialize(); // 검색 취소 시 최신 영화 목록으로 복구
                      });
                    }
                  });
                },
              ),
            ]),
        body: ListView.builder(
            itemCount: this.moviesCount,
            itemBuilder: (BuildContext context, int position) {
              Movie movie = this.movies[position];
              String imageUrl = movie.posterPath != null
                  ? iconBase + movie.posterPath!
                  : defaultImage;
              return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                    ),
                    title: Text(movie.title),
                    subtitle:
                    Text('개봉: ${movie.releaseDate}  평점: ${movie.voteAverage}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(movie),
                        ),
                      );
                    },
                  ));
            }));
  }
}
