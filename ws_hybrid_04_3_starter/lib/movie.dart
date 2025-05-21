class Movie {
  int id = 0;
  String title = "";
  double voteAverage = 0.0;
  String releaseDate = "";
  String overview = "";
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage,
      this.releaseDate, this.overview, this.posterPath);

  // json을 dto로 담기 위해서 필요함.
  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average']*1.0;
    this.releaseDate = parsedJson['release_date'];
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}




