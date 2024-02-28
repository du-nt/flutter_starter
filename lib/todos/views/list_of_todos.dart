import 'package:dio/dio.dart';
import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/extentions/context_extention.dart';
import 'package:flutter_starter/todos/models/todo_model.dart';
import 'package:flutter_starter/todos/views/add_todo.dart';
import 'package:flutter_starter/helpers/injection_container.dart';
import 'package:signals/signals_flutter.dart';

import '../../stores/theme.dart';
import '../../widgets/with_indicator.dart';
import '../repositories/todo_repository.dart';

class TodoList extends HookWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final limit = useState(5);

    final query = useQuery<List<Todo>, DioException>(
      'todos-${limit.value}',
      () => locator<TodoRepository>()
          .getTodos(queryParameters: {'_limit': limit.value}),
      initial: [],
    );

    void navigateToAddTodoScreen() async {
      final shouldRefresh = await context.navigate<bool>(AddTodo());

      if (shouldRefresh == true) {
        query.refresh();
      }
    }

    return WithIndicatorScaffold(
      query: query,
      backgroundColor: Colors.blueGrey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddTodoScreen,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todos'),
        actions: [
          Watch((_) {
            return IconButton(
              onPressed: changeTheme,
              icon: Icon(isDarkMode.value ? Icons.light_mode : Icons.dark_mode),
            );
          }),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Text(limit.value.toString()),
            ElevatedButton(
                onPressed: () {
                  limit.value++;
                },
                child: const Text('Limit')),
            Visibility(
              visible: query.data != null,
              replacement: Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('No todos',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    )),
              ),
              child: Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10),
                    itemCount: query.data?.length,
                    itemBuilder: (context, int index) {
                      final item = query.data![index];
                      return ListTile(
                        title: Text('${item.id}'),
                        subtitle: Text(item.title),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
