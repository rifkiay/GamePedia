import 'package:flutter/material.dart';
import 'dart:async';
import 'package:GamePedia/api/api.dart'; 
import 'package:logger/logger.dart'; 
import 'package:GamePedia/berita/berita_detail.dart';

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

  final APIService apiService = APIService();
  List<dynamic> data = [];
  final Logger logger = Logger();

  // Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    startAutoScroll();
    fetchDataFromAPI();
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

  void fetchDataFromAPI() async {
    String apiUrl = 'http://10.0.2.2:8000/berita'; 
    try {
      var fetchedData = await apiService.fetchData(apiUrl);
      setState(() {
        data = fetchedData;
      });
    } catch (e) {
      logger.e('Error fetching data: $e');
    }
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
                    top: screenHeight * 0.02, 
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
              const SizedBox(height: 100), 

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
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(
                                color: Colors.transparent), 
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

              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.isNotEmpty
                      ? data.take(5).map((news) {
                          return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BeritaDetail(data: news),
                              ),
                            );
                          },
                          child: Container(
                                width: 150,
                                height: 150,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'http://10.0.2.2:8000/storage/gambar_news/${news['gambar']}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white.withOpacity(0.6), // Transparent background
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      news['judul'],
                                      maxLines: 1, // Limit the text to 2 lines
                                      overflow: TextOverflow.ellipsis, // Add ellipsis if text is too long
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                )
                              );
                            }).toList()
                          : [Container()], // Placeholder kosong jika data kosong
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
