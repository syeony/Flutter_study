import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpBookApp(),
    );
  }
}

class HttpBookApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpBookApp> {
  String result = '';
  late TextEditingController _editingController;
  // 스크롤 controller...
  late ScrollController _scrollController;

  late List data;
  int page = 1;

  @override
  void initState() {
    super.initState();
    data = [];
    _editingController = TextEditingController();
    // 무한 스크롤
    // 스크롤 위치 제일 아래에 오면 다시 조회.
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >= _scrollController.position.maxScrollExtent ) {
        print('bottom');
        page++;
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: TextField(
          controller: _editingController,
          style: TextStyle(color: Colors.deepPurple),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(hintText: '검색어를 입력하세요',
            hintStyle: TextStyle(color: Colors.black38),
          ),
          // onSubmitted: (value) async{
          //   page = 1;
          //   data.clear();
          //   getJSONData();
          // }
        ),
      ),
      body: Container(
        child: Center(
          child: data.length == 0
              ? Text(
            '데이터가 존재하지 않습니다.\n 다시 검색해주세요',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          )
              : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        data[index]['thumbnail'],
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                        errorBuilder: (context, exception, trace) =>
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: new Image.asset("assets/noimage.jpg", width: 70,))
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            width:
                            MediaQuery.of(context).size.width - 150,
                            child: Text(
                              data[index]['title'].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width:
                            MediaQuery.of(context).size.width - 150,
                            child: Text(
                              '저자 : ${data[index]['authors'].toString()}',
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                              '가격 : ${data[index]['sale_price'].toString()}'),
                          Text(
                              '판매중 : ${data[index]['status'].toString()}'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: data.length,
            controller: _scrollController,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data.clear();
          getJSONData();
        },
        child: Icon(Icons.search),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url =
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query='
        '${_editingController.value.text}';
    var response = await http.get(Uri.parse(url),
        headers: {"Authorization": "KakaoAK c1af57d95dbdd7ffac7b269e851140f9"});

    print(response.body); // 검색 결과 로그창으로 확인

    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data.addAll(result);
    });
    return response.body;
  }
}
