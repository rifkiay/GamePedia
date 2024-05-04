import 'package:flutter/material.dart';
import 'package:game_pedia/api/api.dart';
import 'package:logger/logger.dart';

class Berita extends StatefulWidget {
  const Berita({super.key});
  
  @override
  BeritaState createState() => BeritaState();
}

class BeritaState extends State<Berita> {
  final PageController _pageController = PageController();
  final APIService apiService = APIService();
  dynamic data;
  final Logger logger = Logger();

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
    return Scaffold(
      body: data != null
          ? ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('News: ${data![index]['title']} - ID: ${data![index]['id']}'),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
