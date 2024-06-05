import 'package:flutter/material.dart';
import 'package:GamePedia/signin_up/signin.dart';
import 'package:GamePedia/homepage/appbardll.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,  // Allows the body to extend behind the AppBar
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF240750),
              Color(0xFF344C64),
              Color(0xFF577B8D),
              Color(0xFF577B8D),
              Color(0xFF57A6A1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Google
              Image.asset(
                'assets/logo/google.png',
                height: 100,
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Nama'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Konfirmasi Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const AppBarDll()),
                  );
                },
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
