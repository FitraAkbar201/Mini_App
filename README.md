# Mini Stok — Flutter Mini App P03

## Deskripsi Aplikasi

Mini Stok merupakan aplikasi sederhana berbasis Flutter untuk membantu pengguna mengelola data persediaan barang. Aplikasi ini memiliki tiga halaman utama, yaitu Dashboard, Daftar Barang, dan Tambah Barang.

Fitur yang tersedia meliputi:
- Menampilkan ringkasan jumlah jenis barang, total stok, dan stok menipis.
- Menampilkan daftar barang menggunakan `ListView.builder()`.
- Mencari barang berdasarkan nama.
- Menambahkan barang melalui formulir dengan input nama, jumlah stok, dan kategori.
- Melakukan validasi agar data kosong atau tidak sesuai tidak dapat disimpan.

Data barang disimpan sementara di dalam memori aplikasi sehingga tidak menggunakan database permanen.

## Struktur Proyek

- `models/` — menyimpan model data barang.
- `data/` — menyimpan data awal barang.
- `screens/` — menyimpan tiga halaman aplikasi.
- `widgets/` — menyimpan widget yang dapat digunakan kembali.
- `test/` — menyimpan pengujian aplikasi.

## Bug dan Cara Mengatasinya

Saat menjalankan perintah `flutter analyze`, ditemukan error `The name 'MyApp' isn't a class` pada file `test/widget_test.dart`. Masalah terjadi karena file pengujian masih memanggil class bawaan Flutter bernama `MyApp`, sedangkan class utama aplikasi sudah diubah menjadi `MiniApp`.

Saya menemukan masalah tersebut melalui hasil pemeriksaan `flutter analyze`. Solusinya adalah memperbarui kode pengujian agar menggunakan `MiniApp` dan menyesuaikan skenario pengujian dengan tampilan Dashboard aplikasi. Setelah diperbaiki, `flutter analyze` dan `flutter test` berhasil dijalankan tanpa error.

## Link vidio:
https://youtu.be/Zu9XSrJ1m-w 