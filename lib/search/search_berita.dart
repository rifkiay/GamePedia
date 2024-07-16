import 'package:flutter/material.dart';

class SearchBerita extends StatelessWidget {
  final List<dynamic> data;

  const SearchBerita({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index]['judul']),
        );
      },
    );
  }
}