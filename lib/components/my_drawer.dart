import 'package:flutter/material.dart';
import 'package:food_delivery/components/my_drawer_tile.dart';
import 'package:food_delivery/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.build_outlined,
              size: 90,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            buttonText: 'Profile',
            icon: Icons.person,
            onTap: () {},
          ),
          MyDrawerTile(
            buttonText: 'Settings',
            icon: Icons.settings,
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));},
          ),
          MyDrawerTile(
            buttonText: 'Logout',
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
