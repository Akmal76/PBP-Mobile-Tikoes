import 'package:flutter/material.dart';
import 'package:tikoes/screens/albumlist_form.dart';
import 'package:tikoes/screens/albumlist_view.dart';
import 'package:tikoes/data/album_model.dart';

class AlbumItem {
  final String name;
  final IconData icon;
  final Color color;

  AlbumItem(this.name, this.icon, this.color);
}

class AlbumCard extends StatelessWidget {
  final AlbumItem item;

  const AlbumCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Lihat Album") {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => AlbumListPage(albums: albums,),
              ),
            );
          }
          else if (item.name == "Tambah Album") {
            // Melakukan navigasi ke MaterialPageRoute yang mencakup AlbumFormPage.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AlbumFormPage(),
              ),
            );
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          color: item.color,
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