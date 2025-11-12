import 'package:flutter/material.dart';
import 'package:exam_schedule_app/screens/details.dart';
import 'package:exam_schedule_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити - 201205',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 5, 65, 129),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>
            const MyHomePage(title: 'Распоред за испити - 201205'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}
