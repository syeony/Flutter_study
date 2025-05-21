import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'movie.dart';


class HttpHelper {

  final String urlKey = 'api_key= [ 획득한 API Key 넣기 ] ';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=ko-KR';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=[ API Key 넣기  ] &query=';

  Future<List> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    //http.get 함수를 이용하여 영화 정보를 받고 전달된 JSON 타입의 결과를
    //리스트 형태로 변환하여 리턴한다.
    //코드 구현 --------------------------------






    return [];
  }

}
