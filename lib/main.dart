import 'package:flutter/material.dart';
import 'package:lab10/widgets/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

var mainColor = const Color(0xFF4857D1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            minimumSize: const Size(0, 45),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.deepPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            side: const BorderSide(color: Colors.deepPurple),
            minimumSize: const Size(0, 45),
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}



