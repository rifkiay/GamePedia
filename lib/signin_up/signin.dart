import 'package:flutter/material.dart';
import 'package:game_pedia/homepage/appbardll.dart';
import 'package:game_pedia/signin_up/signup.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate the desired width for the input fields and button
    final desiredWidth = screenWidth * 0.9; // Decrease width by 10%

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF7EEDD), // Set the background color
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
                        SizedBox(
                          width: desiredWidth,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter your email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                      30), // Circular at the start
                                  right: Radius.circular(
                                      30), // Circular at the end
                                ),
                                borderSide:
                                    BorderSide.none, // Remove border color
                              ),
                              fillColor: Color(0xFFDCECE6),
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black), // Change label text color to black
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: desiredWidth,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                      30), // Circular at the start
                                  right: Radius.circular(
                                      30), // Circular at the end
                                ),
                                borderSide:
                                    BorderSide.none, // Remove border color
                              ),
                              fillColor: Color(0xFFDCECE6),
                              filled: true,
                              labelStyle: TextStyle(color: Colors.black), // Change label text color to black
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: desiredWidth,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AppBarDll()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(
                                      0xFFACE2E1)), // Set the button background color
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(
                                      120, 60)), // Adjust the minimum size
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            height:
                                10), // Add spacing between button and "Forgot your password?" text

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Signup()), // Ganti dengan halaman tujuan untuk signup dengan Google
                            );
                          },
                          child: const Text(
                            'Forgot your password?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center, // Center the text
                          ),
                        ),

                        const SizedBox(height: 50), 

                        GestureDetector(
                          onTap: () {
                            // Handle "Login with Google" action
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Signup()), // Ganti dengan halaman tujuan untuk login dengan Google
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/logo/google.png',
                                height: 20,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Login with Google',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          

          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                // Handle "SignUp with Google" action
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Signup()), // Ganti dengan halaman tujuan untuk signup dengan Google
                );
              },
              child: Container(
                color: Colors.transparent, // Make the container transparent
                padding: const EdgeInsets.all(16),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'assets/logo/google.png',
                    //   height: 20,
                    // ),
                    SizedBox(width: 10),
                    Text(
                      'SignUp with Google',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
