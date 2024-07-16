import 'package:flutter/material.dart';
import 'package:GamePedia/api/api.dart';
import 'package:GamePedia/market/market_detail.dart';

class Market extends StatelessWidget {
  const Market({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Market'),
      ),
      body: FutureBuilder(
        future: apiService.fetchData('https://orange-monkey-189505.hostingersite.com/market'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (snapshot.hasData && snapshot.data != null) {
            List<dynamic> marketData = snapshot.data;
            return ListView.builder(
              itemCount: marketData.length,
              itemBuilder: (context, index) {
                var marketItem = marketData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MarketDetail(
                          data: marketItem,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.green, // Example color
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://orange-monkey-189505.hostingersite.com/storage/market/${marketItem['gambar']}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 150,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.6),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          marketItem['game'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Container(); // Placeholder kosong jika data belum tersedia
          }
        },
      ),
    );
  }
}


