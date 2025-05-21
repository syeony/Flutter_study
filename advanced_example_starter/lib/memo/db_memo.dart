class Memo {
  int id;
  String title;
  String contents;

  Memo({required this.id, required this.title, required this.contents});

  @override
  String toString() {
    return '<Memo>{id: $id, title: $title, contents: $contents}';
  }
}