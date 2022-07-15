class TodoItem {
  int id;
  String title;
  String? description;
  bool isCompleted;

  TodoItem(
      {required this.id,
      this.description,
      required this.isCompleted,
      required this.title});
}
