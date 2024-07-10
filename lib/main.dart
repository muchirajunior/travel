import 'package:flutter/material.dart';
import 'package:travel/utils/routes.dart';
import 'package:travel/utils/theme.dart';
import 'package:travel/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      navigatorKey: Utils.navigatorKey,
      routes: routes,
    );
  }
}
