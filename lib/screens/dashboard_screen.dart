import 'package:flutter/material.dart';

import '../data/dummy_barang.dart';
import 'daftar_barang_screen.dart';
import 'tambah_barang_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final int totalJenisBarang = dummyBarang.length;

    final int totalStok = dummyBarang.fold(
      0,
      (total, barang) => total + barang.stok,
    );

    final int stokMenipis = dummyBarang
        .where((barang) => barang.stok <= 10)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mini Stok'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Kelola persediaan barang toko dengan mudah.',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 24),

            // Ringkasan jumlah barang
            Row(
              children: [
                Expanded(
                  child: _SummaryCard(
                    title: 'Jenis Barang',
                    value: '$totalJenisBarang',
                    icon: Icons.inventory_2,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SummaryCard(
                    title: 'Total Stok',
                    value: '$totalStok',
                    icon: Icons.storage,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            _SummaryCard(
              title: 'Stok Menipis',
              value: '$stokMenipis',
              icon: Icons.warning_amber,
            ),

            const SizedBox(height: 28),

            const Text(
              'Menu Utama',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.list_alt),
                label: const Text('Lihat Daftar Barang'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DaftarBarangScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_box),
                label: const Text('Tambah Barang'),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.green),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
