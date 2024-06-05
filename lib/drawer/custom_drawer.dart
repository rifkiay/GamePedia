import 'package:flutter/material.dart';
import 'package:GamePedia/controllers/user_controllers.dart';
import 'package:GamePedia/profile/profile.dart';
import 'package:GamePedia/signin_up/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = UserController.user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
          decoration: const BoxDecoration(
            color:  Color(0xFF41C9E2),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: user?.photoURL != null
                      ? NetworkImage(user!.photoURL!)
                      : null,
                  child: user?.photoURL == null
                      ? const Icon(Icons.person, size: 30)
                      : null,
                ),
                const SizedBox(height: 10),
                Text(
                  user?.displayName ?? 'Guest',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings page
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await UserController.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Signin()),
              );
            },
          ),
        ],
      ),
    );
  }
}
