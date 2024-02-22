import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

void main() {
  // Set the flag to determine which router to use
  bool useFirstRouter = true;

  runApp(MyApp(useFirstRouter: useFirstRouter));
}

class MyApp extends StatelessWidget {
  final bool useFirstRouter;

  const MyApp({required this.useFirstRouter});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Multi Router Example',
        routerDelegate: useFirstRouter
            ? BeamerDelegate(
                locationBuilder: RoutesLocationBuilder(
                  routes: {
                    '/': (context, state, data) => FirstHomePage(),
                    '/firstPage': (context, state, data) => FirstPage(),
                  },
                ),
              )
            : BeamerDelegate(
                locationBuilder: RoutesLocationBuilder(
                  routes: {
                    '/': (context, state, data) => SecondHomePage(),
                    '/secondPage': (context, state, data) => SecondPage(),
                  },
                ),
              ),
        routeInformationParser: BeamerParser(),
      );
}

// First Home Page
class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beamer First Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/firstPage');
            },
            child: const Text('Go to Beamer First Page'),
          ),
        ),
      );
}

// Second Home Page
class SecondHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Beamer Second Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Beamer.of(context).beamToNamed('/secondPage');
            },
            child: const Text('Go to Beamer Second Page'),
          ),
        ),
      );
}

// First Page
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('First Page'),
        ),
        body: const Center(
          child: Text('This is the First Page'),
        ),
      );
}

// Second Page
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: const Center(
          child: Text('This is the Second Page'),
        ),
      );
}
