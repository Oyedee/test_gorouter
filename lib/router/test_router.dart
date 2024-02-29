import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/language_screen.dart';
import '../features/main_app/bottom_nav_scaffold.dart';
import '../features/main_app/main_app.dart';
import '../features/pos_app/drc_app.dart';
import '../features/pos_app/drc_bottom_nav_scaffold.dart';
import '../main_gorouter.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKeyMain = GlobalKey<NavigatorState>();
final _shellNavigatorKeyDRC = GlobalKey<NavigatorState>();
final _shellNavigatorKeyMainNav = GlobalKey<NavigatorState>();
final _shellNavigatorKeyDRCNav = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LanguageScreen()),
    ShellRoute(
      navigatorKey: _shellNavigatorKeyMain,
      builder: (context, state, child) => MainApp(child: child),
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKeyMainNav,
          builder: (context, state, child) => BottomNavScaffold(child: child),
          routes: [
            GoRoute(
              path: '/main',
              parentNavigatorKey: _shellNavigatorKeyMainNav,
              builder: (context, state) => FirstHomePage(),
            ),
            GoRoute(
              path: '/firstPage',
              parentNavigatorKey: _shellNavigatorKeyMainNav,
              builder: (context, state) => FirstPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/main',
          parentNavigatorKey: _shellNavigatorKeyMain,
          builder: (context, state) => FirstHomePage(),
        ),
        GoRoute(
          path: '/firstPage',
          parentNavigatorKey: _shellNavigatorKeyMain,
          builder: (context, state) => FirstPage(),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKeyMain,
          builder: (context, state) => FirstHomePage(),
          routes: [
            GoRoute(
              path: 'terms-of-services',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => FirstPage(),
            ),
          ],
        ),
      ],
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKeyDRC,
      builder: (context, state, child) => DRCApp(child: child),
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKeyDRCNav,
          builder: (context, state, child) => DRCBottomNavScaffold(child: child),
          routes: [
            GoRoute(
              path: '/drc',
              parentNavigatorKey: _shellNavigatorKeyDRCNav,
              builder: (context, state) => SecondHomePage(),
            ),
            GoRoute(
              path: '/secondPage',
              parentNavigatorKey: _shellNavigatorKeyDRCNav,
              builder: (context, state) => SecondPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/drc',
          parentNavigatorKey: _shellNavigatorKeyDRC,
          builder: (context, state) => SecondHomePage(),
        ),
        GoRoute(
          path: '/secondPage',
          parentNavigatorKey: _shellNavigatorKeyDRC,
          builder: (context, state) => SecondPage(),
        ),
        GoRoute(
          path: '/settings',
          parentNavigatorKey: _shellNavigatorKeyDRC,
          builder: (context, state) => SecondHomePage(),
          routes: [
            GoRoute(
              path: 'terms-of-services',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => SecondPage(),
            ),
          ],
        ),
      ],
    )
  ],
);
