import 'package:flutter/material.dart';

import 'filmler.dart';

class FilmDetay extends StatefulWidget {
  Filmler film;
   FilmDetay({super.key,required this.film});

  @override
  State<FilmDetay> createState() => _FilmDetayState();
}

class _FilmDetayState extends State<FilmDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/${widget.film.film_resim}'),
            Text(widget.film.film_yil.toString()),
            Text(widget.film.yonetmenler.yonetmen_ad),
          ],
        ),
      ),
    );
  }
}
