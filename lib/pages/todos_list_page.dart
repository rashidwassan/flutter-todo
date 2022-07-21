import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_list_provider.dart';

class TodoListPage extends StatelessWidget {
  static const String routeName = 'todos-list-page';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Todos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer<TodoListProvider>(
              builder: ((context, todosListProvider, child) => Expanded(
                    child: ListView.builder(
                        itemCount: todosListProvider.todoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text(todosListProvider.todoList[index].title),
                          );
                        }),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
