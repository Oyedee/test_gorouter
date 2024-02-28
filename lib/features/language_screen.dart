import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Select Language'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/main');
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/drc');
              },
              child: const Text('DRC'),
            ),
          ],
        ),
      );
}
