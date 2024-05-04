import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  // Fungsi untuk mengambil data dari API
  Future<dynamic> fetchData(String url) async {
    var response = await http.get(Uri.parse(url), headers: {'Accept' : 'application/json'});

    if (response.statusCode == 200) {
      // Jika koneksi berhasil, parse data JSON
      return json.decode(response.body);
    } else {
      // Jika koneksi gagal, lempar exception
      throw Exception('Failed to load data');
    }
  }
}
