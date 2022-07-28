import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/components/todos_count_button.dart';
import 'package:todo/constants/images.dart';
import 'package:todo/providers/todo_list_provider.dart';

import '../models/todo.dart';

class DataInputScreen extends StatefulWidget {
  static const String routeName = 'data-input-screen';
  DataInputScreen({Key? key}) : super(key: key);

  @override
  State<DataInputScreen> createState() => _DataInputScreenState();
}

class _DataInputScreenState extends State<DataInputScreen> {
  final TextEditingController _titleFieldController = TextEditingController();

  final TextEditingController _descriptionFieldController =
      TextEditingController();

  late final prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    for (int i = 1; i <= prefs.getInt('numberOfTodos'); i++) {
      Provider.of<TodoListProvider>(context, listen: false)
          .addTodoFromStringList(prefs.getStringList(i.toString()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleFieldController.dispose();
    _descriptionFieldController.dispose();
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
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TodosCountButton(),
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
              onPressed: () async {
                TodoItem newTask = TodoItem(
                  id: Provider.of<TodoListProvider>(context, listen: false)
                          .todoList
                          .length +
                      1,
                  title: _titleFieldController.text,
                  description: _descriptionFieldController.text,
                  isCompleted: false,
                );
                Provider.of<TodoListProvider>(context, listen: false)
                    .addTodo(newTask: newTask);

                await prefs.setStringList(newTask.id.toString(), <String>[
                  newTask.id.toString(),
                  newTask.title,
                  newTask.description,
                  newTask.isCompleted.toString()
                ]);

                await prefs.setInt(
                    'numberOfTodos',
                    Provider.of<TodoListProvider>(context, listen: false)
                        .todoList
                        .length);
              },
              child: const Text('Add'))
        ]),
      ),
    );
  }
}
