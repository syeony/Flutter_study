import 'package:http/http.dart' as http;
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  /*
  api키 발급받는법
  www.themoviedb.org
  여기 가서 회원가입하고 마이페이지 가서 api키 요청
   */
  final String urlKey = 'api_key=[본인API키]';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=[본인API키]&language=ko-KR&query=';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    http.Response result = await http.get(Uri.parse(upcoming));
    if (result.statusCode == 200) {
      Map data = json.decode(result.body);
      List results = data['results'];
      List movies = results.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } else {
      return [];
    }
  }

  // 검색 기능 함수
  Future<List> searchMovies(String query) async {
    final String searchUrl = 'https://api.themoviedb.org/3/search/movie?'
        '$urlKey&language=ko-KR&query=${Uri.encodeComponent(query)}';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      List results = data['results'];
      List movies = results.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } else {
      return [];
    }
  }
}
