import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'router/test_router.dart';

void main() {
  // Set the flag to determine which router to use
  bool useFirstRouter = true;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Multi Router Example',
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}

// First Home Page
class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Main App 1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/firstPage');
            },
            child: const Text('Main App 1'),
          ),
        ),
      );
}

// Second Home Page
class SecondHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('DRC App 1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/secondPage');
            },
            child: const Text('DRC App 1'),
          ),
        ),
      );
}

// First Page
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Main App 2'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Main App 2'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/main');
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      );
}

// Second Page
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('DRC App 2'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('DRC App 2'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/drc');
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      );
}
