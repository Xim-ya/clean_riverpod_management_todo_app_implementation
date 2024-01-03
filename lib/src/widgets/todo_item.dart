part of '../home.dart';

class TodoItem extends HookConsumerWidget with HomeState, HomeEvent {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = currentTodo(ref);
    final itemFocusNode = useFocusNode();
    final itemIsFocused = useIsFocused(itemFocusNode);

    final textEditingController = useTextEditingController();
    final textFieldFocusNode = useFocusNode();

    return Material(
      color: Colors.white,
      elevation: 6,
      child: Focus(
        focusNode: itemFocusNode,
        onFocusChange: (focused) => editTodoDesc(
          ref,
          isFocused: focused,
          textEditingController: textEditingController,
          selectedTodo: todo,
        ),
        child: ListTile(
          onTap: () => requestTextFieldsFocus(
              textFieldFocusNode: textFieldFocusNode,
              itemFocusNode: itemFocusNode),
          leading: Checkbox(
            value: todo.completed,
            onChanged: (value) => toggleTodoState(ref, todoId: todo.id),
          ),
          title: itemIsFocused
              ? TextField(
                  autofocus: true,
                  focusNode: textFieldFocusNode,
                  controller: textEditingController,
                )
              : Text(todo.description),
        ),
      ),
    );
  }
}
