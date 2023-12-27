import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/current_todo_provider.dart';
import 'package:clean_riverpod_management/src/providers/filtered_todos_provider.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/umcompleted_todo_count_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

mixin class HomeStateTest {
  List<Todo> filteredTodos(ProviderContainer container) =>
      container.read(filteredTodosProvider);

  Todo currentTodo(ProviderContainer container) =>
      container.read(currentTodoProvider);

  int uncompletedTodosCount(ProviderContainer container) =>
      container.read(uncompletedTodosCountProvider);

  TodoListFilter todoListFilter(ProviderContainer container) =>
      container.read(todoListFilterProvider);
}
