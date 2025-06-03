import 'package:films_app/kategoriler.dart';
import 'package:films_app/veri_tabani_yardimcisi.dart';
import 'package:films_app/yonetmenler.dart';

import 'filmler.dart';

class Filmlerdao {
  Future<List<Filmler>> tumFilmlerByKategoriId (int kategori_id) async {
    var db = await VeriTabaniYardimcisi().veriTabaniErisim();

    List<Map<String,dynamic>> maps =await db.rawQuery('SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = $kategori_id');
   return List.generate(maps.length, (index){
     var satir = maps[index];
     var k = Kategoriler(kategori_id: satir['kategori_id'], kategori_ad: satir['kategori_ad']);
     var y = Yonetmenler(yonetmen_id: satir['yonetmen_id'], yonetmen_ad: satir['yonetmen_ad']);
     var f = Filmler(film_id: satir['film_id'], film_ad: satir['film_ad'], film_yil: satir['film_yil'], film_resim: satir['film_resim'], kategoriler: k, yonetmenler: y);

     return f;
   });
  }
}