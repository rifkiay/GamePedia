import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'GamePedia',
      home: MainApp(),

    )
  );
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
         title: const Text('Hello'),
      ),

      body:  Container(
          alignment: Alignment.center,
          color: Colors.blue,
          constraints: const BoxConstraints.expand(), // Menyesuaikan ukuran Container dengan ukuran child
          child: Column(children: [
            const Text('Rifki'),
            Image.asset('images/image.jpeg')
          ],)
      ),
      )
    );
  }
}


