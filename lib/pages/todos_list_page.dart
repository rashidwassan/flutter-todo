import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/providers/todo_list_provider.dart';

class TodoListPage extends StatefulWidget {
  static const String routeName = 'todos-list-page';
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  dynamic prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    if (prefs != null) {
      print(prefs.getStringList('1'));
    }
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
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  (todosListProvider.todoList[index].id)
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            title:
                                Text(todosListProvider.todoList[index].title),
                            subtitle: Text(
                              todosListProvider.todoList[index].description,
                            ),
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
