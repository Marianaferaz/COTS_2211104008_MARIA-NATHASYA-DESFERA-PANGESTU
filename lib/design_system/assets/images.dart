import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Illustration Slicing'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Tambahkan Gojek Logo
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/gojek_logo.png', // Ganti dengan nama file logo Gojek
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                // Tambahkan Gambar Language
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'assets/language.png', // Ganti dengan nama file gambar Language
                      fit: BoxFit.contain,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                // Loop untuk 8 gambar ilustrasi
                for (var i = 1; i <= 8; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        'assets/illustration$i.png', // Menggunakan nama file sesuai urutan
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
