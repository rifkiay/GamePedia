import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  final List<dynamic> data;

  const SearchHome({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          title: Text(item['judul'] ?? 'No Title'),
          subtitle: Text(item['game'] ?? 'No Game'),
        );
      },
    );
  }
}