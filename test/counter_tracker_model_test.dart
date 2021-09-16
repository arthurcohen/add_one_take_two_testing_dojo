import 'package:add_one_take_two_testing_dojo/counter_tracker_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('''
    Given a new counter tracker model
    When nothing happens
    Then should have a list with 1 within
  ''', () {
    var counterModel = CounterTrackerModel();

    final notifyListenerCallback = MockCallbackFunction();

    counterModel.addListener(notifyListenerCallback);

    expect(counterModel.counter, equals([1]));

    verifyNever(notifyListenerCallback());
  });
}

class MockCallbackFunction extends Mock {
  call();
}
