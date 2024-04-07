class TodoModel {
  int id;
  String title;
  DateTime createdAt;

  TodoModel({required this.id, required this.title, required this.createdAt});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
