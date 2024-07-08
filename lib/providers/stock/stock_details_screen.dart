import 'package:flutter/material.dart';
import 'package:TB_MOBILE/models/stock.dart';

class DetailScreen extends StatelessWidget {
  final Stock stocks;

  const DetailScreen({Key? key, required this.stocks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          stocks.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown, // Ubah warna AppBar menjadi coklat
        centerTitle: true,
      ),
      body: Container(
        color: Colors.brown.shade100, // Mengubah background color ke coklat muda
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://via.placeholder.com/150', // Ganti dengan URL gambar kopi jika ada
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Center(
                child: Text(
                  stocks.nama,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.brown, // Ubah warna teks menjadi coklat
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Stock: ${stocks.qty}',
                style: const TextStyle(
                  color: Colors.brown, // Ubah warna teks menjadi coklat
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Weight: ${stocks.weight} ${stocks.attr}',
                style: const TextStyle(
                  color: Colors.brown, // Ubah warna teks menjadi coklat
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
