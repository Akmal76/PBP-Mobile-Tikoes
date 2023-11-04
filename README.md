# 🎸 TiKoes 👨🏻

**Tugas - Pemrograman Berbasis Platform - Kelas D**
> **TiKoes** (**T**eknologi **I**nventaris pada album **Koes** Plus) adalah aplikasi *mobile* untuk mengelola penyimpanan berbagai macam album Koes Plus.

# Tugas 7: Elemen Dasar Flutter
## *Stateless Widget* dan *Stateful Widget*
Secara singkat,
* **Stateless Widget**: *Widget* yang tidak dapat berubah setelah dibuat.
* **Stateful Widget**: *Widget* yang dapat berubah secara dinamis.

Perbedaan kedua *widget* dapat dilihat pada tabel berikut ini.
| Atribut | Stateless Widgets | Stateful Widgets |
|--|--|--|
| Mutable State | Tidak memiliki *mutable state* | Dapat memiliki *mutable state* |
| Sifat | Statis, tidak merespons peristiwa eksternal | Dinamis, dapat mengubah atribut berdasarkan interaksi *user* atau perubahan data |
| *Rebuild* | Tidak dilakukan | *Rebuild* pada saat *state* diperbarui |
| Kasus Penggunaan | Menampilkan konten statis, seperti teks, ikon, atau gambar | Menangani elemen UI dinamis seperti komponen interaktif |
| Kinerja | Sangat efisien dan ringan | Mungkin memiliki *overhead* sedikit lebih tinggi karena manajemen *state* |
| Kompleksitas Kode | Sederhana | Memerlukan manajemen *state* dan implementasi logika perubahan *state* |
| Fleksibilitas Penggunaan | Cocok untuk komponen yang tidak memerlukan pembaruan yang sering | Penting untuk komponen yang berubah secara teratur |
| Contoh Widget | Teks, Ikon, Gambar | Checkbox, TextField, Slider |

**Widget Life Cycle pada Flutter**:
<p align="center"><img src="https://admin.tops-int.com/storage/media/editor_images/12025.png" width="900"></p>

**Decision Tree**:
<p align="center"><img src="https://admin.tops-int.com/storage/media/editor_images/97441.png" width="900"></p>

## Widget yang Digunakan
| Widget | Fungsi |
|--|--|
| `MyApp` (`MaterialApp`) | Mengonfigurasi aplikasi Flutter secara global serta menentukan tema dan halaman beranda. |
| `Scaffold` | Membuat tata letak dasar aplikasi. |
| `AppBar` | Menampilkan bagian atas aplikasi dengan judul dan latar belakang warna. |
| `Text` | Menampilkan teks dengan format yang sesuai. |
| `SingleChildScrollView`| Wrapper yang memungkinkan konten dapat discroll jika melebihi ukuran layar. |
| `Padding` | Memberikan jarak antara konten dengan tepi layar. |
| `Column` | Menampilkan widget-child secara vertikal. |
| `GridView.count` | Menampilkan item dalam bentuk grid. Mengatur tata letak grid dengan baris dan kolom. |
| `ShopCard` | Custom widget yang menampilkan setiap item dalam grid, termasuk ikon dan teks. |
| `Material` | Memberikan warna latar belakang dan efek responsif saat item di-klik. |
| `InkWell` | Membuat area yang responsif terhadap sentuhan, mendeteksi tindakan seperti ketika item di-klik. |
| `Icon` | Menampilkan ikon yang sesuai dengan setiap item dalam grid. |
| `SnackBar` | Menampilkan pesan sementara atau pemberitahuan di bagian bawah layar ketika item di-klik. |

## Implementasi Tugas
### Membuat Program Flutter Baru
#### *Getting Started with Flutter*
Dalam langkal awal ini, saya pastikan bahwa Flutter sudah ter-*install*. Saya menyiapkan sebuah direktori baru dan menjalankan perintah berikut pada terminal untuk membuat sebuah proyek Flutter baru.
```
flutter create tikoes
cd tikoes
```

#### Merapikan Struktur Proyek
Agar kode proyek mudah dipahami, saya merapikan struktur *file* pada proyek yang dimana hal ini merupakan salah satu bentuk *best practice* dalam pengembangan aplikasi.
1. Membuat file baru `menu.dart` pada `tikoes/lib` dan menambahkan kode berikut.
```dart
import 'package:flutter/material.dart';
```
2. Memindahkan `class MyHomePage ...` dari `main.dart` ke `menu.dart` dan menghapus `class _MyHomePage State ...` di `main.dart`.
3. Terakhir, menambahkan kode berikut pada `main.dart`.
```dart
import 'package:tikoes/menu.dart';
```

### Membuat Tombol Sederhana
#### Menambahkan Teks dan Card
1. Saya mendefinisikan suatu tombol dalam *class* baru seperti berikut ini.
```dart
class AlbumItem {
  final String name;
  final IconData icon;

  AlbumItem(this.name, this.icon);
}
```
2. Pada `menu.dart`, saya menambahkan kode berikut ini dibawah `MyHomePage({Key? key}) : super(key: key);` untuk menambahkan tombol-tombol sederhana.
```dart
final List<AlbumItem> items = [
    AlbumItem("Lihat Item", Icons.checklist),
    AlbumItem("Tambah Item", Icons.add_box_outlined),
    AlbumItem("Logout", Icons.logout),
];
```
3. Saya membuat *class* baru yaitu custom stateless widget seperti kode dibawah ini.
```dart
class AlbumCard extends StatelessWidget {
  final AlbumItem item;

  const AlbumCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.orange.shade600,
      child: InkWell(
        // TODO: Tambahkan snackbar disini!
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

#### Tampilan Halaman Utama
Untuk menampilkannya, tambahkan kode berikut ini di dalam `class MyHomePage`.
```dart
@override
Widget build(BuildContext context) {
return Scaffold(
    appBar: AppBar(
        title: const Text(
            'Tikoes',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
        ),
        backgroundColor: Colors.orange.shade800,
    ),
    body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
        padding: const EdgeInsets.all(10.0), // Set padding dari halaman
        child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                'Selamat datang!', // Text yang menandakan toko
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
                ),
            ),
            // Grid layout
            GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((AlbumItem item) {
                // Iterasi untuk setiap item
                return AlbumCard(item);
                }).toList(),
            ),
            ],
        ),
        ),
    ),
    );
}
```

### Memunculkan `Snackbar`
Tambahkan kode berikut ini pada `TODO: Tambahkan snackbar disini` pada `class AlbumCard ...` di `menu.dart`.
```dart
// Area responsive terhadap sentuhan
onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}!")));
},
```

Dengan begitu, selesai sudah pembuatan proyek Flutter baru. Saya menjalankan proyek menggunakan Google Chrome dengan perintah berikut ini.
```
flutter run -d chrome
```

## Referensi
* TOPSTECHNOLOGIES - [Mastering Stateless and Stateful Widgets in Flutter & The Best Flutter Course](https://www.tops-int.com/blog/mastering-stateless-and-stateful-widgets-in-flutter-the-best-flutter-course)
* PBP Ganjil 23/24 - [Tutorial 6: Pengantar Flutter](https://pbp-fasilkom-ui.github.io/ganjil-2024/docs/tutorial-6)
* Tim Dosen PBP - [Introduction to Dart Programming Language and Flutter Framework](https://scele.cs.ui.ac.id/pluginfile.php/197253/mod_resource/content/1/08%20-%20Intro%20to%20Dart%20Programming%20and%20Flutter%20Framework.pdf)