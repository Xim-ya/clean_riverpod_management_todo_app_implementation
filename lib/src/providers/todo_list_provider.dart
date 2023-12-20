import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListProvider = NotifierProvider<TodoList, List<Todo>>(TodoList.new);
