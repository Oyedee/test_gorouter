import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}
