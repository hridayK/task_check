class TaskModel {
  int? id;
  final String title;
  final String desc;

  TaskModel({this.id, required this.title, required this.desc});

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
