
import 'package:flutter/material.dart';
import '../data/dummy_barang.dart';
import '../models/barang.dart';

class TambahBarangScreen extends StatefulWidget {
  const TambahBarangScreen({super.key});

  @override
  State<TambahBarangScreen> createState() =>
      _TambahBarangScreenState();
}

class _TambahBarangScreenState
    extends State<TambahBarangScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController =
      TextEditingController();

  final TextEditingController _stokController =
      TextEditingController();

  String? _kategoriDipilih;

  final List<String> kategoriBarang = [
    'Sembako',
    'Makanan',
    'Minuman',
    'Perlengkapan',
    'Lainnya',
  ];

  @override
  void dispose() {
    _namaController.dispose();
    _stokController.dispose();
    super.dispose();
  }

  void _simpanBarang() {
    if (_formKey.currentState!.validate()) {
      final int stok = int.parse(_stokController.text);

      final int idBaru = dummyBarang.isEmpty
          ? 1
          : dummyBarang
                  .map((barang) => barang.id)
                  .reduce((a, b) => a > b ? a : b) +
              1;

      final barangBaru = Barang(
        id: idBaru,
        nama: _namaController.text.trim(),
        kategori: _kategoriDipilih!,
        stok: stok,
      );

      dummyBarang.add(barangBaru);

      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Barang'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Masukkan Informasi Barang',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Input nama barang
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Barang',
                  hintText: 'Contoh: Beras',
                  prefixIcon: Icon(Icons.inventory_2),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama barang tidak boleh kosong';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Input jumlah stok
              TextFormField(
                controller: _stokController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Jumlah Stok',
                  hintText: 'Contoh: 20',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Jumlah stok tidak boleh kosong';
                  }

                  final stok = int.tryParse(value);

                  if (stok == null) {
                    return 'Stok harus berupa angka bulat';
                  }

                  if (stok < 0) {
                    return 'Stok tidak boleh negatif';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Pilihan kategori
              DropdownButtonFormField<String>(
                initialValue: _kategoriDipilih,
                decoration: const InputDecoration(
                  labelText: 'Kategori Barang',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                items: kategoriBarang.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(kategori),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kategoriDipilih = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan pilih kategori barang';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Tombol simpan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _simpanBarang,
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan Barang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
