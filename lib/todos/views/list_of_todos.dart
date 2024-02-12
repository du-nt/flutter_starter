import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/todos/provider/todo_provider.dart';
import 'package:flutter_starter/todos/views/add_todo.dart';
import 'package:flutter_starter/todos/views/example_dropdown.dart';
import 'package:flutter_starter/extentions/context_extention.dart';

class TodoList extends ConsumerStatefulWidget {
  const TodoList({super.key});

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends ConsumerState<TodoList> {
  int limit = 2;

  void _decrease() {
    setState(() {
      limit++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todosProvider(limit: limit, offset: 3));

    return Scaffold(
        backgroundColor: Colors.blueGrey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.navigate(AddTodo());
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(context.l18n.welcome(343, 'hello')),
          centerTitle: true,
          backgroundColor: Colors.amber[200],
        ),
        body: Column(
          children: [
            const DropdownMenuExample(),
            ElevatedButton(
                onPressed: _decrease, child: const Text('Increase limit')),
            Expanded(
              child: todos.when(
                  data: (items) => ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];

                          return ListTile(
                            title: Text('${item.id}'),
                            subtitle: Text(item.title),
                          );
                        },
                      ),
                  error: (error, stackTrace) => Text('error: $error'),
                  loading: () => const Text('loading')),
            ),
          ],
        ));
  }
}
