class Album {
  final String  name;
  final int     price;
  final String  description;
  final String  image;

  Album(this.name, this.price, this.description, this.image);
}

// List album (+ dummy data)
List <Album> albums = [
  Album("Dheg Dheg Plas", 600000, "Dheg Dheg Plas adalah album perdana dari grup musik Koes Plus setelah berganti nama dari Koes Bersaudara yang dirilis pada 1 November 1969 di bawah label Melody.", "https://upload.wikimedia.org/wikipedia/id/7/72/Dheg_Dheg_Plas.jpg"),
  Album("Volume 2", 453000, "Volume 2 adalah album kedua dari grup musik Koes Plus yang dirilis pada 27 Desember 1970 di bawah label Mesra.", "https://upload.wikimedia.org/wikipedia/id/6/6b/Koes_Plus_Volume_2.jpg"),
];