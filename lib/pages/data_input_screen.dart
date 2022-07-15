import 'package:flutter/material.dart';
import 'package:todo/constants/images.dart';
import 'package:todo/data/todos.dart';
import 'package:todo/models/todo.dart';

class DataInputScreen extends StatefulWidget {
  DataInputScreen({Key? key}) : super(key: key);

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController _titleFieldController = TextEditingController();

  final TextEditingController _descriptionFieldController =
      TextEditingController();

  @override
  void dispose() {
    //TODO: Please read about dispose method in Flutter
    super.dispose();
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
  }

  // method to add todoItem in todo list
  void addToTodos() {
    TodoItem newTask = TodoItem(
      id: Todos.todos.length,
      isCompleted: false,
      title: _titleFieldController.text,
    );

    Todos.todos.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    // adding listeners to listen input changes
    // _titleFieldController.addListener(() {
    //   print(_titleFieldController.text);
    // });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry Screen'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.check_box),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Image.asset(
              Images.dataInputScreenImage,
              height: 200,
            ),
          ),
          Flexible(
            child: TextField(
              controller: _titleFieldController,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _descriptionFieldController,
                  decoration: const InputDecoration(
                      label: Text('Description'), border: OutlineInputBorder()),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {
                addToTodos();
              },
              child: const Text('Add'))
        ]),
      ),
    );
  }
}
