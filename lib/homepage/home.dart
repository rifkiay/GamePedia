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
  final List<String> coffeeTypes = ['All', 'Berita', 'Market', 'Community'];
  int selectedIndex = 0;


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
    final screenWidth= MediaQuery.of(context).size.width;

    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: screenHeight * 0.115,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xFF41C9E2),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.02, // Adjust this value to change how much of the SizedBox is outside the Container
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    child: SizedBox(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.9,
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
                  ),
                ],
              ),
              const SizedBox(height: 100), // Adjusted for better spacing

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(coffeeTypes.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ChoiceChip(
                          label: Text(coffeeTypes[index]),
                          selected: selectedIndex == index,
                          selectedColor: const Color(0xFF41C9E2),
                          backgroundColor: const Color(0xffE3E3E3),
                          onSelected: (bool selected) {
                            setState(() {
                              selectedIndex = selected ? index : 0;
                            });
                          },
                          labelStyle: TextStyle(
                            color: selectedIndex == index ? Colors.white : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0), // Sesuaikan dengan kebutuhan Anda
                            side:  const BorderSide(color: Colors.transparent), // Hilangkan border
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

               SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20), // Sesuaikan dengan kebutuhan Anda
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20), // Sesuaikan dengan kebutuhan Anda
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20), // Sesuaikan dengan kebutuhan Anda
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20), // Sesuaikan dengan kebutuhan Anda
                ),   
              )
            ],
          ),
        ),
      ),
    );
  }
}