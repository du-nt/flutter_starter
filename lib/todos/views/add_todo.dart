import 'package:dio/dio.dart';
import 'package:fl_query_hooks/fl_query_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/helpers/injection_container.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../helpers/error_handler.dart';
import '../repositories/todo_repository.dart';

class AddTodo extends HookWidget {
  AddTodo({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(text: '');
    final addTodo = useMutation<void, DioException, String, dynamic>(
        'add-todo', (title) => locator<TodoRepository>().createTodo(title),
        onData: (data, recoveryData) {
          Navigator.pop(context, true);
        },
        onError: (_, __) => handleError(context));

    void handleAddTodo() {
      if (!_formKey.currentState!.validate()) return;

      FocusScope.of(context).unfocus();
      addTodo.mutate(titleController.text);
    }

    final theme = Theme.of(context);

    return Stack(
      children: [
        Scaffold(
            appBar:
                AppBar(title: const Text('Add new todo'), centerTitle: true),
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
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.maxLength(5)
                  ]),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.indigo[50],
                    ),
                    onPressed: handleAddTodo,
                    child: const Text('Add')),
              ]),
            )),
        addTodo.isMutating
            ? Positioned(
                child: Container(
                  color: theme.dialogBackgroundColor.withOpacity(0.2),
                  child: Center(
                    child: AlertDialog(
                      content: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text('Please wait …')
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
