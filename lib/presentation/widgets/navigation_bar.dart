import 'package:flutter/material.dart';

class NavigationBars extends StatelessWidget {
  const NavigationBars({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF1ee491),
            ),
            child: Center(
              child: ListTile(
                title: const Text('SKILL UP NOW'),
                subtitle: const Text('TAP HERE'),
                onTap: () {},
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.play_circle_outline),
            title: const Text('Episodes'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text('About'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
