import 'package:flutter/material.dart';

class SearchMarket extends StatelessWidget {
  final List<dynamic> data;

  const SearchMarket({super.key, required this.data});

  @override
 Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['game']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}