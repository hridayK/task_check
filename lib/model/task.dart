class Task {
  int? id;
  final String title;
  final String desc;

  Task({this.id, required this.title, required this.desc});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
    };
  }

  @override
  String toString() {
    return 'Task(id:$id, title:$title, desc:$desc)';
  }
}
