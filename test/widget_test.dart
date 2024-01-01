// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_riverpod_management/main.dart';
import 'package:clean_riverpod_management/src/home.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:clean_riverpod_management/src/test_keys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Add new todo',
    (WidgetTester tester) async {
      await tester.pumpWidget(ProviderScope(child: MyApp()));

      final element = tester.element(find.byType(HomePage));
      final container = ProviderScope.containerOf(element);

      const inputText = 'New Todo';

      await tester.enterText(find.byKey(addTodoKey), inputText);
      await tester.testTextInput.receiveAction(TextInputAction.done);

      expect(
        container.read(todoListProvider).last.description,
        inputText,
      );
    },
  );
}
