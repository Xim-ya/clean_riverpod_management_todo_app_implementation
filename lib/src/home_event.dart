import 'package:clean_riverpod_management/src/constants/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/model/todo.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_filter.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEvent {
  ///
  /// Add a new todo to the list and clear the text input field.
  ///
  void addTodo(
    WidgetRef ref, {
    required TextEditingController textEditingController,
    required String value,
  }) {
    ref.read(todoListProvider.notifier).add(value);
    textEditingController.clear();
  }

  ///
  /// Remove the selected todo from the list.
  ///
  void removeTodo(WidgetRef ref, {required Todo selectedTodo}) {
    ref.read(todoListProvider.notifier).remove(selectedTodo);
  }

  ///
  /// Request focus for the text input field and item focus node.
  ///
  void requestTextFieldsFocus(
      {required FocusNode textFieldFocusNode,
      required FocusNode itemFocusNode}) {
    itemFocusNode.requestFocus();
    textFieldFocusNode.requestFocus();
  }

  ///
  /// Change the filter category for the todo list.
  ///
  void changeFilterCategory(WidgetRef ref, {required TodoListFilter filter}) {
    ref.read(todoListFilterProvider.notifier).state = filter;
  }

  ///
  /// Toggle the state (completed/incomplete) of a todo.
  ///
  void toggleTodoState(WidgetRef ref, {required String todoId}) {
    ref.read(todoListProvider.notifier).toggle(todoId);
  }

  ///
  /// Edit the description of a todo. If focused, set the description to the current value.
  /// Otherwise, update the todo with the new description.
  ///
  void editTodoDesc(WidgetRef ref,
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
