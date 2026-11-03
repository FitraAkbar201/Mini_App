import 'package:flutter/material.dart';

import '../data/dummy_barang.dart';
import 'tambah_barang_screen.dart';
import '../widgets/barang_card.dart';

class DaftarBarangScreen extends StatefulWidget {
  const DaftarBarangScreen({super.key});

  @override
  State<DaftarBarangScreen> createState() => _DaftarBarangScreenState();
}

class _DaftarBarangScreenState extends State<DaftarBarangScreen> {
  String kataKunci = '';

  @override
  Widget build(BuildContext context) {
    final daftarHasil = dummyBarang.where((barang) {
      return barang.nama.toLowerCase().contains(kataKunci.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Barang'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Barang',
            onPressed: () async {
              final hasil = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                  builder: (context) => const TambahBarangScreen(),
                ),
              );

              if (hasil == true && mounted) {
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Cari nama barang...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataKunci = nilai;
                });
              },
            ),
            const SizedBox(height: 16),

            Expanded(
              child: daftarHasil.isEmpty
                  ? const Center(child: Text('Barang tidak ditemukan.'))
                  : ListView.builder(
                      itemCount: daftarHasil.length,
                      itemBuilder: (context, index) {
                        final barang = daftarHasil[index];

                        return BarangCard(barang: barang);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
