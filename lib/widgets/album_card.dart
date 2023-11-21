import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:tikoes/screens/album_form.dart';
import 'package:tikoes/screens/album_list.dart';
import 'package:tikoes/screens/login.dart';

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
      final request = context.watch<CookieRequest>();
    return Material(
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
                
          if (item.name == "Lihat Album") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AlbumPage()));
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
          else if (item.name == "Logout") {
              final response = await request.logout(
                  "https://akmal-ramadhan21-tugas.pbp.cs.ui.ac.id/auth/logout/");
              String message = response["message"];
              if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$message"),
                ));
              }
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