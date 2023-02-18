class Todo {
  String title;
  bool checkBox;

  Todo({required this.title, this.checkBox = false});

  factory Todo.fromJson(Map json) {
    return Todo(title: json['title'], checkBox: json['checkBox']);
  }

  Map toJson() {
    return{'title':title,'checkBox':checkBox};
  }
}
