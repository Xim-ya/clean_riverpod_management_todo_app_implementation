import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEvent {
  void onTodoSubmitted(
    WidgetRef ref, {
    required TextEditingController textEditingController,
    required String value,
  }) {
    ref.read(todoListProvider.notifier).add(value);
    textEditingController.clear();
  }

  void onTodoDismissed(WidgetRef ref, {required Todo selectedTodo}) {
    ref.read(todoListProvider.notifier).remove(selectedTodo);
  }

  void onCategoryBtnTapped(WidgetRef ref, {required TodoListFilter filter}) {
    ref.read(todoListFilter.notifier).state = filter;
  }

  void onCheckBoxTapped(WidgetRef ref, {required String todoId}) {
    ref.read(todoListProvider.notifier).toggle(todoId);
  }

  void onTodoListTileTapped(
      {required FocusNode textFieldFocusNode,
      required FocusNode itemFocusNode}) {
    itemFocusNode.requestFocus();
    textFieldFocusNode.requestFocus();
  }

  void onTodoListTileFocusChanged(WidgetRef ref,
      {required bool isFocused,
      required TextEditingController textEditingController,
      required Todo selectedTodo}) {
    if (isFocused) {
      textEditingController.text = selectedTodo.description;
    } else {
      ref
          .read(todoListProvider.notifier)
          .edit(id: selectedTodo.id, description: textEditingController.text);
    }
  }
}
