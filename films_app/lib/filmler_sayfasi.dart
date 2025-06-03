import 'package:films_app/film_detay.dart';
import 'package:films_app/filmlerdao.dart';
import 'package:films_app/kategoriler.dart';
import 'package:flutter/material.dart';

import 'filmler.dart';

class FilmlerSayfasi extends StatefulWidget {
  Kategoriler kategori;
   FilmlerSayfasi({super.key,required this.kategori});

  @override
  State<FilmlerSayfasi> createState() => _FilmlerSayfasiState();
}

class _FilmlerSayfasiState extends State<FilmlerSayfasi> {
  Future<List<Filmler>> tumFilmler (int kategori_id) async {
    var filmler = await Filmlerdao().tumFilmlerByKategoriId(kategori_id);
    return filmler;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmler : ${widget.kategori.kategori_ad}'),
      ),
      body: FutureBuilder<List<Filmler>>(future: tumFilmler(widget.kategori.kategori_id), builder: (context,snapshot){
        var filmler =snapshot.data;
        return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2 / 3.5),itemCount: filmler!.length, itemBuilder: (context,index){
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmDetay(film: filmler[index])));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/${filmler[index].film_resim}'),
                ),
                Text(filmler[index].film_ad)
              ],
            ),
          );
        });
      }),
    );
  }
}
