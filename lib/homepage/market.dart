import 'package:flutter/material.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: const Stack(
        children: [
          // // Logo
          // Positioned(
          //   top: 50, // Atur posisi logo sesuai kebutuhan
          //   left: 0, // Atur posisi logo sesuai kebutuhan
          //   right: 0, // Atur posisi logo sesuai kebutuhan
          //   child: Image(
          //     image: AssetImage('assets/logo/logo_gampedia.jpg'),
          //   ),
          // ),
          // // Text
          Center(
            child: Text(
              'Sedang Dalam Proses Pengerjaan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}