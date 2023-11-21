import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tikoes/models/album.dart';
import 'package:tikoes/widgets/left_drawer.dart';
import 'package:tikoes/screens/album_detail.dart';

class AlbumPage extends StatefulWidget {
    const AlbumPage({Key? key}) : super(key: key);

    @override
    _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  Future<List<Album>> fetchAlbum() async {
    var url = Uri.parse(
        'https://akmal-ramadhan21-tugas.pbp.cs.ui.ac.id/get-item/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Album
    List<Album> list_album = [];
    for (var d in data) {
        if (d != null) {
            list_album.add(Album.fromJson(d));
        }
    }
    return list_album;
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Daftar Album',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        backgroundColor: Colors.orange.shade800,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchAlbum(),
        builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
            } else {
                if (!snapshot.hasData) {
                return const Column(
                    children: [
                    Text(
                        "Tidak ada data album.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                    ],
                );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(album: snapshot.data![index]),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${snapshot.data![index].fields.name}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.amount}"),
                        const SizedBox(height: 10),
                        Text("${snapshot.data![index].fields.description}")
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        }
      )
    );
  }
}