import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavScaffold extends StatefulWidget {
  const BottomNavScaffold({required this.child, super.key});
  final Widget child;

  @override
  State<BottomNavScaffold> createState() => _BottomNavScaffoldState();
}

class _BottomNavScaffoldState extends State<BottomNavScaffold> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          onTap: changeTab,
          backgroundColor: Theme.of(context).primaryColorLight,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          ],
        ),
      );

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/main');
        break;
      case 1:
        context.go('/firstPage');
        break;
      default:
        context.go('/main');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
