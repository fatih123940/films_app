import 'package:films_app/veri_tabani_yardimcisi.dart';

import 'kategoriler.dart';

class Kategorilerdao {
  Future<List<Kategoriler>> tumKategoriler () async {
    var db = await VeriTabaniYardimcisi().veriTabaniErisim();

    List<Map<String,dynamic>> maps =await db.rawQuery('SELECT * FROM kategoriler');

    return List.generate(maps.length, (index){
      var satir = maps[index];
      return Kategoriler(kategori_id: satir['kategori_id'], kategori_ad: satir['kategori_ad']);
    });
  }
}