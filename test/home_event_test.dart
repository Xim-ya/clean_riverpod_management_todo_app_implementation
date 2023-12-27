import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEventTest {
  void onTodoSubmitted(
    ProviderContainer container, {
    required TextEditingController textEditingController,
    required String value,
  }) {
    container.read(todoListProvider.notifier).add(value);
    textEditingController.clear();
  }

  void onTodoDismissed(ProviderContainer container,
      {required Todo selectedTodo}) {
    container.read(todoListProvider.notifier).remove(selectedTodo);
  }

  void onFilterBtnTapped(ProviderContainer container,
      {required TodoListFilter filter}) {
    container.read(todoListFilterProvider.notifier).state = filter;
  }

  void onCheckBoxTapped(ProviderContainer container, {required String todoId}) {
    container.read(todoListProvider.notifier).toggle(todoId);
  }

  void onTodoListTileTapped(
      {required FocusNode textFieldFocusNode,
      required FocusNode itemFocusNode}) {
    itemFocusNode.requestFocus();
    textFieldFocusNode.requestFocus();
  }

  void onTodoListTileFocusChanged(ProviderContainer container,
      {required bool isFocused,
      required TextEditingController textEditingController,
      required Todo selectedTodo}) {
    if (isFocused) {
      textEditingController.text = selectedTodo.description;
    } else {
      container
          .read(todoListProvider.notifier)
          .edit(id: selectedTodo.id, description: textEditingController.text);
    }
  }
}
