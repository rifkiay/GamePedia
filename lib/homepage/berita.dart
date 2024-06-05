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
    appBar: AppBar(
      title: const Text('News'),
    ),
    body: data != null
        ? ListView.builder(
            itemCount: data!.length,
            itemBuilder: (context, index) {
              dynamic news = data![index]; // Inisialisasi variabel news
              return ListTile(
                title: Text('${news['judul']}'),
                subtitle: Text(news['deskripsi']), // Deskripsi berita
                leading: Image.network(
                  'http://10.0.2.2:8000/storage/gambar_news/${news['gambar']}',
                  width: 100,
                  height: 100, 
                  fit: BoxFit.cover, // Untuk mengatur bagaimana gambar diatur dalam kotak
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BeritaDetail(data: news),
                    ),
                  );
                },
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          ),
  );
}
}
