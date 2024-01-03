<h1 align="center">Clean Riverpod Management Todo App</h1>
<p align="center"><img src="https://velog.velcdn.com/images/ximya_hf/post/0c586f6b-e197-4311-8141-923af6b5dedd/image.png"/></p>
<p align="center">
Using `Mixin Classes` to structure the usage `scope` of `Riverpod providers` allows for an improved and easily maintainable structure for global provider management, addressing drawbacks associated with globally managed providers and facilitating `maintenance` and `testing`.





<br/>
<br/>



<p align="center"><img src="https://velog.velcdn.com/images/ximya_hf/post/0e15fb75-ed13-4b1e-a3e7-787ee14ece05/image.png"/></p>
<p align="center">
This project is developed based on the ‘Todo app’ from the <a href="https://riverpod.dev/docs/introduction/getting_started">Riverpod official documentation <a/>



## Code Example

### State Mixin Class

```dart
mixin class HomeState {
  ///  
  /// Count of uncompleted todos.  
  ///  
  int uncompletedTodosCount(WidgetRef ref) => ref.watch(uncompletedTodosCountProvider);

  ///  
  /// List of filtered todos.  
  ///  
  List<Todo> filteredTodos(WidgetRef ref) => ref.watch(filteredTodosProvider);

  ///  
  /// Current todo. (Todo witch is focused)  
  ///  
  Todo currentTodo(WidgetRef ref) => ref.watch(currentTodoProvider);

  ///  
  /// Current filter category for the todo list.  
  ///  
  TodoListFilter todoListFilter(WidgetRef ref) =>  ref.watch(todoListFilterProvider);
}
```
<img src="https://velog.velcdn.com/images/ximya_hf/post/417f4b29-3363-4bfc-95a2-0ca8d99beea7/image.png">

<br/>
<br/>


### Event Mixin Class
```dart
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
```
<img src="https://velog.velcdn.com/images/ximya_hf/post/d4eb3d15-e997-45b0-a364-c3dee6354e57/image.png">


There are five significant advantages to this approach

1. Easy maintenance
2. Improved readability
3. Benefits when writing unit test code
4. Increased efficiency in the work process
5. Minimization of mistakes that may occur in the collaboration process


For more detailed information, please refer to my blog post titled <a href="https://medium.com/@ximya/organize-your-global-providers-in-flutter-riverpod-with-mixin-class-562ae2aa3376">"Organize Your “Global” Providers in Flutter Riverpod with Mixin Class"<a/>