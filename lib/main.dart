import 'package:flutter/material.dart';
import 'videoplayer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: Routegenerator.routeGenerator,
    );
  }
}

class Routegenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => videoPlayer(),
    );
  }
}
