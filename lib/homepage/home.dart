import 'package:flutter/material.dart';
import 'dart:async'; // Import the dart:async library

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late PageController pageController;
  int currentPage = 0;
  static const int numPages = 12000;
  static const Duration autoScrollDuration = Duration(seconds: 3);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    startAutoScroll();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  void startAutoScroll() {
    void autoScroll() {
      Timer(autoScrollDuration, () {
        if (currentPage < numPages - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300), // Short duration for smooth transition
          curve: Curves.easeInOut,
        );
        autoScroll();
      });
    }
    autoScroll();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final boxWidth = MediaQuery.of(context).size.width * 0.99;
    final boxHeight = screenHeight * 0.05;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: boxWidth,
                height: boxHeight,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/buce.jpg'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Rifki Ainul Yaqin',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: boxWidth,
                height: boxHeight,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.trending_up),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.bookmark),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.videogame_asset),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.group),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.article),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              //Slider ============================================================= 
              SizedBox(
                height: screenHeight * 0.1,
                child: PageView.builder(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: numPages,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        index % 2 == 0
                            ? 'assets/images/image1.jpg'
                            : 'assets/images/image-20.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              // Rekomendasi ============================================================
              const SizedBox(height: 20), // Spacer between recommendation boxes
              // News Recommendation Section
              Container(
                width: boxWidth,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rekomendasi Berita',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.article),
                      title: const Text('Berita 1'),
                      subtitle: const Text('Deskripsi berita 1'),
                      onTap: () {
                        // Handle onTap for news recommendation 1
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.article),
                      title: const Text('Berita 2'),
                      subtitle: const Text('Deskripsi berita 2'),
                      onTap: () {
                        // Handle onTap for news recommendation 2
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.article),
                      title: const Text('Berita 3'),
                      subtitle: const Text('Deskripsi berita 3'),
                      onTap: () {
                        // Handle onTap for news recommendation 3
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Spacer between recommendation boxes
              // Product Recommendation Section
              Container(
                width: boxWidth,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Rekomendasi Barang',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Barang 1'),
                      subtitle: const Text('Deskripsi barang 1'),
                      onTap: () {
                        // Handle onTap for product recommendation 1
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Barang 2'),
                      subtitle: const Text('Deskripsi barang 2'),
                      onTap: () {
                        // Handle onTap for product recommendation 2
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: const Text('Barang 3'),
                      subtitle: const Text('Deskripsi barang 3'),
                      onTap: () {
                        // Handle onTap for product recommendation 3
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
