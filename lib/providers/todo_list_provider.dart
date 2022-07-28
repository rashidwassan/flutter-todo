import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoItem> _todos = [];

  void addTodo({required TodoItem newTask}) {
    _todos.add(newTask);
    notifyListeners();
  }

  void addTodoFromStringList(List<String> todoInfo) {
    _todos.add(TodoItem(
        id: int.parse(todoInfo[0]),
        title: todoInfo[1],
        description: todoInfo[2],
        isCompleted: todoInfo[3] == 'true'));

    notifyListeners();
  }

  List<TodoItem> get todoList {
    return _todos;
  }
}
