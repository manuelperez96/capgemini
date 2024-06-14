import 'package:capgemini/ui/counter/counter_page.dart';
import 'package:capgemini/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.standard,
      home: const CounterPage(),
    );
  }
}
