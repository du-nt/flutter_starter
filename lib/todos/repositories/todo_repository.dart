import '../models/todo_model.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos({Map<String, dynamic>? queryParameters});
  Future<void> createTodo(String title);
  Future<void> updateTodo(int id, String title);
  Future<void> deleteTodo(int id);
  Future<void> toggleTodo(int id);
}
