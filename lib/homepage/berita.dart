import 'package:flutter/material.dart';
import 'package:GamePedia/api/api.dart';
import 'package:GamePedia/berita/berita_detail.dart';
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
    String apiUrl = 'https://orange-monkey-189505.hostingersite.com/berita'; 
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
        title: const Text('News'),
      ),
      body: data != null
          ? ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                dynamic news = data![index]; // Inisialisasi variabel news
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(
                        news['judul'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          news['deskripsi'],
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://orange-monkey-189505.hostingersite.com/storage/gambar_news/${news['gambar']}',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover, // Untuk mengatur bagaimana gambar diatur dalam kotak
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BeritaDetail(data: news),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
