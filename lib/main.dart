import 'package:add_one_take_two_testing_dojo/counter_tracker_model.dart';
import 'package:add_one_take_two_testing_dojo/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterTrackerModel(),
      child: const MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}
