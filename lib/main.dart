import 'package:flutter/material.dart';
import 'package:flutter_application/pages/testewidgetspage/testewidgetspage.dart';
import 'pages/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home:
          const TesteWidgetsPage(), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
