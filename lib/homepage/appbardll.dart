import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:GamePedia/homepage/berita.dart';
import 'package:GamePedia/homepage/market.dart';
import 'package:GamePedia/homepage/home.dart';
import 'package:GamePedia/api/api.dart';
import 'package:GamePedia/drawer/custom_drawer.dart';

class AppBarDll extends StatefulWidget {
  const AppBarDll({super.key});

  @override
  AppBarDllState createState() => AppBarDllState();
}

class AppBarDllState extends State<AppBarDll> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final APIService apiService = APIService();
  dynamic data;
  final Logger logger = Logger();
  String searchText = '';

  @override
  void initState() {
    super.initState();
    // fetchDataFromAPI();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // void fetchDataFromAPI() async {
  //   String apiUrl = 'http://10.0.2.2:8000/';
  //   try {
  //     var fetchedData = await apiService.fetchData(apiUrl);
  //     setState(() {
  //       data = fetchedData;
  //     });
  //   } catch (e) {
  //     logger.e('Error fetching data: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF41C9E2),
        title: Padding(
          padding: const EdgeInsets.only(right: 1.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: _getSearchPlaceholder(),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 16.0),
                    prefixIcon: const Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                    if (_selectedIndex == 0) {
                      searchHome(value);
                    } else if (_selectedIndex == 1) {
                      searchBerita(value);
                    } else if (_selectedIndex == 2) {
                      searchMarket(value);
                    }
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.chat),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: const CustomDrawer(), //drawer
      backgroundColor: Colors.grey[200],
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          Home(),
          Berita(),
          Market(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Market',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF41C9E2),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            searchHome(searchText);
          } else if (index == 1) {
            searchBerita(searchText);
          } else if (index == 2) {
            searchMarket(searchText);
          }
        },
      ),
    );
  }

  String _getSearchPlaceholder() {
    if (_selectedIndex == 0) {
      return 'Search in Home';
    } else if (_selectedIndex == 1) {
      return 'Search in Berita';
    } else if (_selectedIndex == 2) {
      return 'Search in Market';
    } else {
      return 'Search';
    }
  }

  void searchHome(String query) {
    logger.i('Searching in Home: $query');
  }

  void searchBerita(String query) {
    logger.i('Searching in Berita: $query');
  }

  void searchMarket(String query) {
    logger.i('Searching in Market: $query');
  }
}
