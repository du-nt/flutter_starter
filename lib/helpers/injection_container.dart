import 'package:flutter_starter/todos/repositories/remote/todo_repository_impl.dart';
import 'package:flutter_starter/todos/repositories/todo_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void initializeDependencies() {
  locator.registerSingleton<TodoRepository>(RemoteTodoRepositoryImpl());
}
