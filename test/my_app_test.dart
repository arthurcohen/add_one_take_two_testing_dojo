import 'package:add_one_take_two_testing_dojo/counter_tracker_model.dart';
import 'package:add_one_take_two_testing_dojo/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('''
    Given a new my app instance
    When model has only [1]
    Then should display 1
  ''', (WidgetTester tester) async {
    final counterTrackerMock = CounterTrackerModelMock();
    when(() => counterTrackerMock.counter).thenReturn([1]);

    await tester.pumpWidget(createTestableWidget(counterTrackerMock));

    var matcher = find.text('1');

    expect(matcher, findsOneWidget);
  });

  testWidgets('''
    Given a new my app instance
    When model has only [1, 2]
    Then should display 1 and 2
  ''', (WidgetTester tester) async {
    final counterTrackerMock = CounterTrackerModelMock();
    when(() => counterTrackerMock.counter).thenReturn([1, 2]);

    await tester.pumpWidget(createTestableWidget(counterTrackerMock));

    var matcherOne = find.text('1');
    var matcherTwo = find.text('2');

    expect(matcherOne, findsOneWidget);
    expect(matcherTwo, findsOneWidget);
  });

  testWidgets('''
    Given a new my app instance
    When tap the add button
    Then should call count method
  ''', (WidgetTester tester) async {
    final counterTrackerMock = CounterTrackerModelMock();
    when(() => counterTrackerMock.counter).thenReturn([1]);

    await tester.pumpWidget(createTestableWidget(counterTrackerMock));

    // encontrar botão
    final button = find.byKey(const Key('add_button'));

    // clicar no botão
    await tester.tap(button);

    // await pump
    await tester.pump();

    // verificar que count foi chamado
    verify(() => counterTrackerMock.count());
  });
}

Widget createTestableWidget(CounterTrackerModelMock counterTrackerMock) {
  return ListenableProvider<CounterTrackerModel>(
    create: (context) => counterTrackerMock,
    child: const MaterialApp(
      home: MyApp(),
    ),
  );
}

class CounterTrackerModelMock extends Mock implements CounterTrackerModel {}
