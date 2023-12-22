// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_riverpod_management/main.dart';
import 'package:clean_riverpod_management/src/home.dart';
import 'package:clean_riverpod_management/src/providers/todo_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

class TestHome extends ConsumerWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

void main() {
  testWidgets('Add new todo', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    final targetWidget = Home();
    final element = tester.element(find.byWidget(targetWidget));
    final container = ProviderScope.containerOf(element);

    const inputText = 'New Todo';

    // await tester.enterText(find.byKey(addTodoKey), inputText);
    // await tester.testTextInput.receiveAction(TextInputAction.done);

    expect(
      container.read(todoListProvider).last.description,
      inputText,
    );

    // Tap the add button
    // await tester.tap(find.byKey(addTodoKey));
    // await tester.pump();

    // Verify that the new todo is added.
    // expect(find.text('New Todo'), findsOneWidget);
  });
}
