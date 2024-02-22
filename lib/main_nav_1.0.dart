import 'package:flutter/material.dart';

void main() {
  // Set the flag to determine which router to use
  bool useFirstRouter = true;

  runApp(MyApp(useFirstRouter: useFirstRouter));
}

class MyApp extends StatelessWidget {
  final bool useFirstRouter;

  MyApp({required this.useFirstRouter});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Multi Router Example',
        // Use different home pages based on the flag
        home: useFirstRouter ? FirstHomePage() : SecondHomePage(),
        // Use different route generators based on the flag
        onGenerateRoute: useFirstRouter ? FirstRouter.generateRoute : SecondRouter.generateRoute,
      );
}

// First Router Configuration
class FirstRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstHomePage());
      case '/firstPage':
        return MaterialPageRoute(builder: (_) => FirstPage());
      default:
        return null;
    }
  }
}

// Second Router Configuration
class SecondRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SecondHomePage());
      case '/secondPage':
        return MaterialPageRoute(builder: (_) => SecondPage());
      default:
        return null;
    }
  }
}

// First Home Page
class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('First Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/firstPage');
            },
            child: const Text('Go to First Page'),
          ),
        ),
      );
}

// Second Home Page
class SecondHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Second Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/secondPage');
            },
            child: const Text('Go to Second Page'),
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
