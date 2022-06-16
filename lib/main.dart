import 'package:flutter/material.dart';
import 'package:flutter_notes/app_routes.dart';
import 'package:flutter_notes/core/di/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: kRoutes,
    );
  }
}
