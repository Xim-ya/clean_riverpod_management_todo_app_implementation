import 'package:clean_riverpod_management/src/home_event.dart';
import 'package:clean_riverpod_management/src/home_state.dart';
import 'package:clean_riverpod_management/src/providers/current_todo_provider.dart';
import 'package:clean_riverpod_management/src/test_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constants/todo_list_filter.dart';
import 'hooks/use_is_focused.dart';

part 'widgets/title.dart';
part 'widgets/todo_item.dart';
part 'widgets/tool_bar.dart';

class HomePage extends HookConsumerWidget with HomeState, HomeEvent {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = filteredTodos(ref);

    final newTodoController = useTextEditingController();

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          const Title(),
          TextField(
            key: addTodoKey,
            controller: newTodoController,
            decoration: const InputDecoration(
              labelText: 'What needs to be done?',
            ),
            onSubmitted: (value) => addTodo(
              ref,
              textEditingController: newTodoController,
              value: value,
            ),
          ),
          const SizedBox(height: 42),
          const Toolbar(),
          if (todos.isNotEmpty) const Divider(height: 0),
          for (var i = 0; i < todos.length; i++) ...[
            if (i > 0) const Divider(height: 0),
            Dismissible(
              key: ValueKey(todos[i].id),
              onDismissed: (_) => removeTodo(ref, selectedTodo: todos[i]),
              child: ProviderScope(
                overrides: [
                  currentTodoProvider.overrideWithValue(todos[i]),
                ],
                child: const TodoItem(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
