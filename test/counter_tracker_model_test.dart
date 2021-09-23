import 'package:add_one_take_two_testing_dojo/counter_tracker_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  test('''
    Given a new counter tracker model
    When nothing happens
    Then should have a list with 1 within 
    and should never warn listener
  ''', () {
    var counterModel = CounterTrackerModel();

    final notifyListenerCallback = MockCallbackFunction();

    counterModel.addListener(notifyListenerCallback);

    expect(counterModel.counter, equals([1]));

    verifyNever(() => notifyListenerCallback());
  });

  test('''
    Given a new counter tracker model
    When count is called
    Then should have a list with 1 and 2 within
    and listener should be called once
  ''', () {
    var counterModel = CounterTrackerModel();

    final notifyListenerCallback = MockCallbackFunction();

    counterModel.addListener(notifyListenerCallback);

    counterModel.count();

    expect(counterModel.counter, equals([1, 2]));

    verify(() => notifyListenerCallback());
  });

  test('''
    Given a new counter tracker model
    When count is called twice
    Then should have a list with 1, 2 and 3 within
    and listener should be called twice
  ''', () {
    var counterModel = CounterTrackerModel();

    final notifyListenerCallback = MockCallbackFunction();

    counterModel.addListener(notifyListenerCallback);

    counterModel.count();
    counterModel.count();

    expect(counterModel.counter, equals([1, 2, 3]));

    verify(() => notifyListenerCallback()).called(2);
  });
}

class MockCallbackFunction extends Mock {
  call();
}
