import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:GamePedia/api/api.dart'; 
class BeritaDetail extends StatelessWidget {
  final dynamic data;
  final APIService apiService = APIService();
  final Logger logger = Logger();

  BeritaDetail({super.key, required this.data});

  Future<String> fetchAuthorName(int authorId) async {
    String apiUrl = 'https://orange-monkey-189505.hostingersite.com/authors';
    try {
    dynamic authorData = await apiService.fetchData(apiUrl);
    // Loop through authorData to find the author with matching id
    for (var author in authorData) {
      if (author['id'] == authorId) {
        return author['name']; // Return the name of the matching author
      }
    }
    throw Exception('Author with ID $authorId not found');
    } catch (e) {
      logger.e('Error fetching author name: $e');
      throw Exception('Failed to load author name from API');
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Berita Detail'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['judul'],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Image.network(
            'https://orange-monkey-189505.hostingersite.com/storage/gambar_news/${data['gambar']}',
            width: MediaQuery.of(context).size.width,
            height: 200,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(
            'Tanggal Posting: ${data['tanggal_posting']}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder(
            future: fetchAuthorName(data['author_id']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                logger.e('Error fetching author name: ${snapshot.error}');
                return const Text('Error fetching author name');
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'ID Penulis: ${data['author_id']}',
                    //   style: const TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Text(
                      'Nama Penulis: ${snapshot.data}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 10),
          Text(
            'Kategori: ${data['kategori']}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Deskripsi: ${data['deskripsi']}',
          ),
        ],
      ),
    ),
  );
}

}