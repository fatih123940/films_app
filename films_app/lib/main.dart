import 'package:films_app/filmler_sayfasi.dart';
import 'package:films_app/kategorilerdao.dart';
import 'package:flutter/material.dart';

import 'kategoriler.dart';

void main () {
  runApp(FilmApp());
}

class FilmApp extends StatelessWidget {
  const FilmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Kategoriler>> tumKategorileriGoster () async {
    var kategoriler = await Kategorilerdao().tumKategoriler();
    return kategoriler;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
      ),
      body: FutureBuilder<List<Kategoriler>>(future: tumKategorileriGoster(), builder: (context,snapshot){
        if(snapshot.hasData){
          var kategoriListesi = snapshot.data;
          return ListView.builder(itemCount:kategoriListesi!.length,itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FilmlerSayfasi(kategori: kategoriListesi[index])));
              },
              child: SizedBox(height:50,child: Card(
                child: Center(child: Text(kategoriListesi[index].kategori_ad)),
              )),
            );
          });
        }else {
          return Center();
        }
      }),
    );
  }
}
