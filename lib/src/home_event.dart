import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin class HomeEvent {
  void onTextFieldSubmitted(
    WidgetRef ref, {
    required TextEditingController textEditingController,
    required String value,
  }) {
    ref.read(todoListProvider.notifier).add(value);
    textEditingController.clear();
  }
}
