import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  // image 는 iconBase+posterpath. posterpath가 null이면 defaultImage로 노출
  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  late String result;
  late HttpHelper helper;
  int moviesCount = 0;
  List movies = [];

  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar= Text('SSAFY Movie');

  Future initialize() async {
    var movieList = [];

    //HttpHelper 클래스의 getUpcoming() 함수를 호출하여 최근 영화 정보를 가져오고 setState로 갱신
    // 구현 ------------------------
    // movieList =





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
        appBar: AppBar(title: searchBar,
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
                          fontSize: 20.0, ),
                        onSubmitted: (String text) {
                            // 상단 검색 엔터면 title로 검색.



                        },
                      );
                    }
                    else {
                      setState(() {
                        this.visibleIcon = Icon(Icons.search);
                        this.searchBar= Text('Movies');
                      });
                    }
                  });
                },

              ),
            ]),
        body: ListView.builder (
            itemCount: this.moviesCount,
            itemBuilder: (BuildContext context, int position) {
              return Card(
                  color: Colors.white,
                  elevation: 2.0,
                  //ListTile에 CircleAvatar, Text(title), Text(개봉시기, 관객 평점), onTap에는 상세 페이지 이동 구현
                  child: ListTile(
                    //리스트에 보여지는 코드를 구현하세요 ~~~~





                  ));
            })
    );
  }

}
