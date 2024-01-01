import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/current_todo_provider.dart';
import 'package:clean_riverpod_management/src/providers/filtered_todos_provider.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/uncompleted_todo_count_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeState {
  ///
  /// Count of uncompleted todos.
  ///
  int uncompletedTodosCount(WidgetRef ref) =>
      ref.watch(uncompletedTodosCountProvider);

  ///
  /// List of filtered todos.
  ///
  List<Todo> filteredTodos(WidgetRef ref) => ref.watch(filteredTodosProvider);

  ///
  /// Current todo. (Todo witch is focused)
  ///
  Todo currentTodo(WidgetRef ref) => ref.watch(currentTodoProvider);

  ///
  /// Current filter category for the todo list.
  ///
  TodoListFilter todoListFilter(WidgetRef ref) =>
      ref.watch(todoListFilterProvider);
}
