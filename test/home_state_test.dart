import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/current_todo_provider.dart';
import 'package:clean_riverpod_management/src/providers/filtered_todos_provider.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/uncompleted_todo_count_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class HomeStateTest {
  ///
  /// Count of uncompleted todos.
  ///
  int uncompletedTodosCount(ProviderContainer container) =>
      container.read(uncompletedTodosCountProvider);

  ///
  /// List of filtered todos.
  ///
  List<Todo> filteredTodos(ProviderContainer ref) =>
      ref.read(filteredTodosProvider);

  ///
  /// Current todo. (Todo witch is focused)
  ///
  Todo currentTodo(ProviderContainer ref) => ref.read(currentTodoProvider);

  ///
  /// Current filter category for the todo list.
  ///
  TodoListFilter todoListFilter(ProviderContainer ref) =>
      ref.read(todoListFilterProvider);
}
