import 'package:flutter/material.dart';

class NotifyListeners extends StatelessWidget {
  NotifyListeners({super.key});
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Notify Listeners"),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      suffix: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: toggle.value
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility))),
                );
              }),
          Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      "${_counter.value}",
                      style: TextStyle(fontSize: 32),
                    );
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _counter.value++;
            print(_counter.value.toString());
          },
          child: Icon(Icons.add)),
    );
  }
}
