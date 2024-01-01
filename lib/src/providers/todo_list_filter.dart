import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final todoListFilterProvider = StateProvider((_) => TodoListFilter.all);
