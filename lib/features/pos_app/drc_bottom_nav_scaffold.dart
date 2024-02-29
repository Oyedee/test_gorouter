import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DRCBottomNavScaffold extends StatefulWidget {
  const DRCBottomNavScaffold({required this.child, super.key});
  final Widget child;

  @override
  State<DRCBottomNavScaffold> createState() => _DRCBottomNavScaffoldState();
}

class _DRCBottomNavScaffoldState extends State<DRCBottomNavScaffold> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          onTap: changeTab,
          backgroundColor: Theme.of(context).primaryColorLight,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab A'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Tab B'),
          ],
        ),
      );

  void changeTab(int index) {
    switch (index) {
      case 0:
        context.go('/drc');
        break;
      case 1:
        context.go('/secondPage');
        break;
      default:
        context.go('/drc');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }
}
