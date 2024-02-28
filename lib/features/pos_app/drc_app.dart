import 'package:flutter/material.dart';

class DRCApp extends StatelessWidget {
  const DRCApp({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(body: child);
}
