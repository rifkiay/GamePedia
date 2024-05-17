import 'package:game_pedia/api/api.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:game_pedia/homepage/berita.dart';
import 'package:game_pedia/homepage/market.dart';
import 'package:game_pedia/homepage/home.dart';

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
    fetchDataFromAPI();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void fetchDataFromAPI() async {
    String apiUrl = 'http://10.0.2.2:8000/';
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

    return Scaffold(
      appBar: AppBar(
        title: const SizedBox.shrink(),
        centerTitle: true,
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText:  _getSearchPlaceholder(),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(color: Colors.white), // Warna border saat aktif (ditekan)
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Update teks pencarian saat berubah
                  setState(() {
                    searchText = value;
                  });
                  // Panggil fungsi pencarian sesuai dengan halaman aktif
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
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 'Settings',
                child: Text('Settings'),
              ),
            ],
            onSelected: (value) {
              if (value == 'Settings') {}
            },
          ),
        ],
        backgroundColor: const Color(0xFF41C9E2),
      ),
      
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

  // Lihat log apakah sudah benar atau tidak
  void searchHome(String query) {
    // Implementasi logika pencarian di halaman Home
    logger.i('Searching in Home: $query');
  }

  // Fungsi pencarian di halaman Berita
  void searchBerita(String query) {
    // Implementasi logika pencarian di halaman Berita
    logger.i('Searching in Berita: $query');
  }

  // Fungsi pencarian di halaman Market
  void searchMarket(String query) {
    // Implementasi logika pencarian di halaman Market
    logger.i('Searching in Market: $query');
  }

  
}
