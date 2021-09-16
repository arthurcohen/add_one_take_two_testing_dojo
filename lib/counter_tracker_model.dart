import 'dart:collection';

import 'package:flutter/material.dart';

class CounterTrackerModel extends ChangeNotifier {
  final List<int> _value = [1];

  List<int> get counter => UnmodifiableListView(_value);

  void count() {
    _value.add(_value.last + 1);

    notifyListeners();
  }
}
