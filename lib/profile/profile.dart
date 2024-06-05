import 'package:flutter/material.dart';
import 'package:GamePedia/controllers/user_controllers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = UserController.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: user != null
          ? Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: user?.photoURL != null
                            ? NetworkImage(user!.photoURL!)
                            : null,
                        child: user?.photoURL == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user?.displayName ?? 'N/A',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const Text(
                        "Senior Graphic Designer",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "1000",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: <Widget>[
                              Text(
                                "1200",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(user?.email ?? 'N/A'),
                ),
                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("1234567891"),
                ),
                const ListTile(
                  leading: Icon(Icons.web),
                  title: Text("@james012"),
                  subtitle: Text("Twitter"),
                ),
                const ListTile(
                  leading: Icon(Icons.link),
                  title: Text("behance.net/james012"),
                  subtitle: Text("Behance"),
                ),
                const ListTile(
                  leading: Icon(Icons.facebook),
                  title: Text("facebook.com/james012"),
                  subtitle: Text("Facebook"),
                ),
              ],
            )
          : const Center(
              child: Text('No user data available'),
            ),
    );
  }
}
