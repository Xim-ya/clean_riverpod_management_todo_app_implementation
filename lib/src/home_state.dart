import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/current_todo_provider.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:clean_riverpod_management/src/providers/umcompleted_todo_count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeState {
  List<Todo> targetTodos(WidgetRef ref) => ref.watch(todoListProvider);

  Todo selectedTodo(WidgetRef ref) => ref.watch(currentTodo);

  int activeTodosCount(WidgetRef ref) => ref.watch(uncompletedTodosCount);

  int activeTodosCountTest(WidgetRef ref) => ref.watch(uncompletedTodosCount);

  TodoListFilter filterCategory(WidgetRef ref) => ref.watch(todoListFilter);
}
