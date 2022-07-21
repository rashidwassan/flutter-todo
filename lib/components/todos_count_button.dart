import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/todo_list_provider.dart';

import '../pages/todos_list_page.dart';

class TodosCountButton extends StatelessWidget {
  const TodosCountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          icon: const Icon(Icons.check_circle),
          onPressed: () {
            Navigator.pushNamed(context, TodoListPage.routeName);
          },
        ),
        Container(
          height: 20,
          width: 20,
          decoration: const BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Consumer<TodoListProvider>(
              builder: (context, value, child) => Text(
                value.todoList.length.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }
}
