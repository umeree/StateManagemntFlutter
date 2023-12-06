import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateamnagement/provider/count_provider.dart';
import 'package:stateamnagement/provider/favorite_provider.dart';
import 'package:stateamnagement/provider/sliderProvider.dart';
import 'package:stateamnagement/screens/count.dart';
import 'package:stateamnagement/screens/favouriteApp.dart';
import 'package:stateamnagement/screens/slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteItemProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FavouriteApp(),
      ),
    );
  }
}
