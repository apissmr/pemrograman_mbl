import 'dart:ui';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendefinisikan warna utama
    Color color = Theme.of(context).primaryColor;

    // Bagian titleSection
    Widget titleSection = Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'Wisata Gunung di Batu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.orange,
          ),
          const Text('41'),
        ],
      ),
    );

    // Bagian buttonSection
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // Bagian textSection
    Widget textSection = Container(
      padding: const EdgeInsets.all(50),
      child: const Text(
        'Kota Batu adalah kota kecil yang terletak di Provinsi Jawa Timur'
        'Selain itu, ada banyak spot wisata alam seperti Coban Rondo, Coban Talun, dan Gunung Panderman yang menarik bagi para pecinta hiking. Batu sering dijadikan pilihan bagi wisatawan yang mencari suasana sejuk, pemandangan alam yang menenangkan, dan aktivitas outdoor yang beragam.'
        'Hafizh Muhammad Rabbani / 2241720242',
        softWrap: true,
      ),
    );

    // Bagian imageSection
    Widget imageSection = Image.asset(
      'assets/alun-alun-kota-batu-HD.png',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    return MaterialApp(
      title: 'Flutter layout: Hafizh Muhammad Rabbani / 2241720242',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imageSection, // Gambar di bagian paling atas
              titleSection,
              buttonSection,
              textSection,
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi _buildButtonColumn untuk membuat kolom tombol
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
