import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/todos/model/todo_model.dart';
import 'package:flutter_starter/todos/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTodo extends HookConsumerWidget {
  AddTodo({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();

    validator(value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }

    void handleAddTodo() {
      if (_formKey.currentState!.validate()) {
        ref.read(todosProvider.notifier).addTodo(
            const Todo(id: 1, userId: 2, title: 'erewr', isCompleted: false),
            () {
          Navigator.pop(context);
        });
      }
    }

    return Scaffold(
        appBar: AppBar(title: const Text('Add new todo'), centerTitle: true),
        body: Form(
          key: _formKey,
          child: ListView(padding: const EdgeInsets.all(20), children: [
            TextFormField(
              autofocus: true,
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.indigo[50],
                ),
                onPressed: handleAddTodo,
                child: const Text('Add'))
          ]),
        ));
  }
}
