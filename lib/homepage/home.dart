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
          duration: const Duration(
              milliseconds: 300), // Short duration for smooth transition
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
    final screenWidth = MediaQuery.of(context).size.width;

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
                    top: screenHeight *
                        0.02, // Adjust this value to change how much of the SizedBox is outside the Container
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
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Sesuaikan dengan kebutuhan Anda
                            side: const BorderSide(
                                color: Colors.transparent), // Hilangkan border
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    // onTap: () => navigateToDetailPage(context),
                    child: const Text(
                      'See More >',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10), // Adjusted for better spacing

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/pizza.jpg'),
                              // Source image https://www.freepik.com/free-photo/crispy-mixed-pizza-with-olives-sausage_6752011.htm#fromView=search&page=1&position=14&uuid=4122d0f8-b3ab-4546-a547-d2b60b795697
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Pizza',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/onion.jpg'),
                              // Source image <a href="https://www.freepik.com/free-photo/high-angle-delicious-fast-food-drink_21744879.htm#fromView=search&page=1&position=11&uuid=6b40bb59-0a64-49b4-aae5-9e9d57ad252a">Image by freepik</a>
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Onion Rings',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image:
                              AssetImage('assets/images/waffle.jpg'),
                              // Source image https://www.google.com/url?sa=i&url=https%3A%2F%2Fjoyfoodsunshine.com%2Fbest-waffles%2F&psig=AOvVaw0uxdO4wEY-E3LQJeDCxcm1&ust=1716107351984000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCLj5oIbkloYDFQAAAAAdAAAAABAE
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Waffles',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/6029646.jpg'),
                    // Source image <a href="https://www.freepik.com/free-vector/computer-trouble-shooting-concept-illustration_18771510.htm#query=maintenance&position=0&from_view=keyword&track=sph&uuid=1a50d48d-7e84-40be-b267-d2f6e54b3eb0">Image by storyset</a> on Freepik
                    fit: BoxFit.cover,
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
