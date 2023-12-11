import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateamnagement/provider/Cart_provider.dart';
import 'package:stateamnagement/provider/auth_provider.dart';
import 'package:stateamnagement/provider/count_provider.dart';
import 'package:stateamnagement/provider/dark_theme_provider.dart';
import 'package:stateamnagement/provider/favorite_provider.dart';
import 'package:stateamnagement/provider/sliderProvider.dart';
import 'package:stateamnagement/screens/cart_list.dart';
import 'package:stateamnagement/screens/count.dart';
import 'package:stateamnagement/screens/dark_theme.dart';
import 'package:stateamnagement/screens/favouriteApp.dart';
import 'package:stateamnagement/screens/login.dart';
import 'package:stateamnagement/screens/slider.dart';
import 'package:stateamnagement/screens/value_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeChanger>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => SliderProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteItemProvider()),
        ChangeNotifierProvider(create: (context) => ThemeChanger()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CartModel()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: CartScreen(),
          );
        },
      ),
    );
  }
}
