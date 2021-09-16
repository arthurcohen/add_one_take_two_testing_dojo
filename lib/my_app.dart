import 'package:add_one_take_two_testing_dojo/counter_tracker_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add 1 take 2'),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: null,
                child: const Icon(Icons.not_interested),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CounterTrackerModel>().count();
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: context
              .watch<CounterTrackerModel>()
              .counter
              .map(
                (e) => Center(
                  child: Text(
                    e.toString(),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
