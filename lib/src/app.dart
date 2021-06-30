import 'package:flutter/material.dart';
import 'package:login_screen_simulator/src/screen/login.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var theme = ThemeData.light();
    return MaterialApp(
      home: Login(),
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.white),
        textTheme: theme.textTheme.apply(
            fontFamily: 'OpenSans',
            bodyColor: Colors.white,
            displayColor: Colors.white),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white)),
          labelStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: Color.fromRGBO(255, 255, 255, 0.1),
        ),
      ),
    );
  }
}
