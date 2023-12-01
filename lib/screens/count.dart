import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateamnagement/provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  // void initState() {
  //   super.initState();
  //   final countProvider = Provider.of<CountProvider>(context, listen: false);
  //   Timer.periodic(Duration(microseconds: 1), (timer) {
  //     countProvider.setCount();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    print("Build");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Example"),
      ),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          print("Just Text is Building");
          return Text(
            value.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
