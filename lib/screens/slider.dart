import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateamnagement/provider/sliderProvider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SliderProvider>(context, listen: false);
    print("Build");
    return Scaffold(
        appBar: AppBar(
          title: Text("Slider"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context, value, child) {
              return Slider(
                  min: 0,
                  max: 1,
                  value: value.value,
                  onChanged: (val) {
                    value.setValue(val);
                  });
            }),
            Row(
              children: [
                Consumer<SliderProvider>(builder: (context, value, child) {
                  return Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: Center(child: Text("Container 1")),
                    ),
                  );
                }),
                Consumer<SliderProvider>(builder: (context, value, child) {
                  return Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: Center(child: Text("Container 2")),
                    ),
                  );
                })
              ],
            )
          ],
        ));
  }
}
