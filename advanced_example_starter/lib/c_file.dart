import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FileApp(),
    );
  }
}

class FileApp extends StatefulWidget {
  FileApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FileApp();
}

class _FileApp extends State<FileApp> {

  int _count = 0;

  @override
  void initState() {
    super.initState();

    initFile();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Example'),
      ),
      body: Container(
        child: Center(
          child: Text(
            '$_count',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count++;
          });
          writeCountFile(_count);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void initFile() async {
    var dir = await getApplicationDocumentsDirectory();
    print('initFile() 호출 ... ${dir.path}');

    var file = File(dir.path + '/count.txt');
    if (await file.exists()) {
      readCountFile();
    }
    else {
      file.writeAsStringSync('0');
    }
  }

  void writeCountFile(int count) async {
    var dir = await getApplicationDocumentsDirectory();
    File(dir.path + '/count.txt').writeAsStringSync(count.toString());
  }

  void readCountFile() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var file = await File(dir.path + '/count.txt').readAsString();
      print(file);
      setState(() {
        _count = int.parse(file);
      });
    } catch (e) {
      print(e.toString());
    }
  }

}
