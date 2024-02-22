import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  // Set the flag to determine which router to use
  bool useFirstRouter = true;

  runApp(MyApp(useFirstRouter: useFirstRouter));
}

class MyApp extends StatelessWidget {
  final bool useFirstRouter;

  MyApp({required this.useFirstRouter});

  @override
  Widget build(BuildContext context) {
    final router = useFirstRouter ? firstRouter() : secondRouter();

    return MaterialApp.router(
      title: 'Multi Router Example',
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }

  GoRouter firstRouter() => GoRouter(
        initialLocation: '/first',
        errorPageBuilder: (context, state) => const MaterialPage(child: Scaffold(body: Center(child: Text('Error')))),
        routes: [
          GoRoute(
            path: '/first',
            builder: (context, state) => FirstHomePage(),
          ),
          GoRoute(
            path: '/firstPage',
            builder: (context, state) => FirstPage(),
          ),
        ],
      );

  GoRouter secondRouter() => GoRouter(
        initialLocation: '/second',
        errorPageBuilder: (context, state) => const MaterialPage(child: Scaffold(body: Center(child: Text('Error')))),
        routes: [
          GoRoute(
            path: '/second',
            builder: (context, state) => SecondHomePage(),
          ),
          GoRoute(
            path: '/secondPage',
            builder: (context, state) => SecondPage(),
          ),
        ],
      );
}

// First Home Page
class FirstHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GoRouter First Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/firstPage');
            },
            child: const Text('Go to GoRouterFirst Page'),
          ),
        ),
      );
}

// Second Home Page
class SecondHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('GoRouter Second Home Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/secondPage');
            },
            child: const Text('Go to GoRouter Second Page'),
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
