import 'package:flutter_starter/helpers/http_delegate.dart';

import '../../models/todo_model.dart';
import '../todo_repository.dart';

class RemoteTodoRepositoryImpl extends TodoRepository with HttpDelegate {
  @override
  Future<List<Todo>> getTodos({Map<String, dynamic>? queryParameters}) async {
    final List<dynamic> response =
        await getRequest('users/1/todos', queryParameters: queryParameters);
    final data = response.map((item) => Todo.fromJson(item)).toList();
    return data;
  }

  @override
  Future<void> createTodo(String title) async {
    await postRequest<Todo>(
        'todos', Todo(id: 1, userId: 1, title: title, isCompleted: false));
  }

  @override
  Future<void> updateTodo(int id, String title) async {}

  @override
  Future<void> deleteTodo(int id) async {}

  @override
  Future<void> toggleTodo(int id) async {}
}
