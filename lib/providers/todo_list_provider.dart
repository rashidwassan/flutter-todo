import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class TodoListProvider with ChangeNotifier {
  List<TodoItem> _todos = [];

  void addTodo({required TodoItem newTask}) {
    _todos.add(newTask);
    notifyListeners();
  }

  List<TodoItem> get todoList {
    return _todos;
  }
}
