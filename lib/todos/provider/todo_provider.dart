import 'package:flutter/material.dart';
import 'package:flutter_starter/helpers/http_delegate.dart';
import 'package:flutter_starter/todos/model/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class Todos extends _$Todos {
  @override
  Future<List<Todo>> build({required int limit, required int offset}) async {
    final response = await dio.get(
      'users/1/todos?_limit=$limit&_offset=$offset',
    );

    final List<dynamic> data = response.data;
    final todos = data.map((todo) => Todo.fromJson(todo)).toList();
    return todos;
  }

  Future<void> addTodo(Todo todo, [Function()? callback]) async {
    await dio.post('users/1/todos', data: todo);

    ref.invalidateSelf();

    await future;

    if (callback != null) {
      callback();
    }
  }
}
