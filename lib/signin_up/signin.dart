import 'package:flutter/material.dart';
import 'package:GamePedia/controllers/user_controllers.dart';
import 'package:GamePedia/homepage/appbardll.dart';
import 'package:GamePedia/signin_up/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:logger/logger.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  SigninState createState() => SigninState();
}

class SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the desired width for the input fields and button
    final desiredWidth = screenWidth * 0.9; // Decrease width by 10%

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255), // Set the background color
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Google
                  Image.asset(
                    'assets/logo/GamePedia.png',
                    height: 200,
                  ),
                  const SizedBox(height: 20),
                  // const Center(
                  //   child: Text(
                  //     'Welcome To GamePedia',
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
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
                                  left: Radius.circular(30), // Circular at the start
                                  right: Radius.circular(30), // Circular at the end
                                ),
                                borderSide: BorderSide.none, // Remove border color
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
                                  left: Radius.circular(30), // Circular at the start
                                  right: Radius.circular(30), // Circular at the end
                                ),
                                borderSide: BorderSide.none, // Remove border color
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
                        Align(
                          alignment: Alignment.centerRight, // Align to the right
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),// Adjusted spacing


                        SizedBox(
                          width: desiredWidth,
                          child: ElevatedButton(
                            onPressed: () async {
                            try {
                              final user = await UserController.loginWithGoogle();
                              if (user != null && mounted) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const AppBarDll(),
                                  ),
                                );
                              }
                            } 
                            on FirebaseAuthException catch(error){
                              // print(error.message);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: 
                                  Text(
                                    error.message ?? "Ups ada yang salah",
                                  )));
                            }
                            catch (error) {
                              // print(error);
                            }
                          },

                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFFACE2E1)), // Set the button background color
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(120, 60)), // Adjust the minimum size
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        const Center(
                          child: Text(
                            'Or login with',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),


                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async {
                            try {
                              final user = await UserController.loginWithGoogle();
                              if (user != null && mounted) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const AppBarDll(),
                                  ),
                                );
                              }
                            } 
                            on FirebaseAuthException catch(error){
                              // print(error.message);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: 
                                  Text(
                                    error.message ?? "Ups ada yang salah",
                                  )));
                            }
                            catch (error) {
                              (error);
                              //  ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(content: 
                              //     Text(
                              //       error.toString(),
                              //     )));
                            }
                          },

                          child: Center( // Menempatkan kotak di tengah layar
                            child: Container(
                              width: screenWidth * 0.2, // Menetapkan lebar kotak
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent, // Warna border
                                ),
                                borderRadius: BorderRadius.circular(30), // Border yang melengkung
                                // color: Colors.grey[200], // Warna latar belakang border
                              ),
                              child: Image.asset(
                                'assets/logo/google.png',
                                height: screenHeight * 0.07,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(16.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Text(
          //           "Not have an account?",
          //           style: TextStyle(
          //             color: Colors.black,
          //           ),
          //         ),
          //         const SizedBox(width: 5), // Add some spacing between the texts
          //         GestureDetector(
          //           onTap: () {
          //             // Handle "SignUp with Google" action
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => const Signup(), // Ganti dengan halaman tujuan untuk signup dengan Google
          //               ),
          //             );
          //           },
          //           child: const Text(
          //             'Register now',
          //             style: TextStyle(
          //               color: Colors.blue,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
