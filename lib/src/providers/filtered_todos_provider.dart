import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredTodosProvider = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilterProvider);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
      return todos;
  }
});
