
import 'package:flutter/material.dart';
import '../models/barang.dart';

class BarangCard extends StatelessWidget {
  final Barang barang;

  const BarangCard({
    super.key,
    required this.barang,
  });

  @override
  Widget build(BuildContext context) {
    final bool stokMenipis = barang.stok <= 10;

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.inventory_2,
            color: Colors.white,
          ),
        ),
        title: Text(
          barang.nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Kategori: ${barang.kategori}',
        ),
        trailing: Text(
          'Stok: ${barang.stok}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: stokMenipis ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
