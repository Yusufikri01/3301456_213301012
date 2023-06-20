import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/Notlar.dart';
import 'VeritabaniYardimcisi2.dart';

class notlardao {
  Future<List<notlar>> TumNotlar() async {
    var db = await VeritabaniYardimcisi2.veritabanierisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM notlar");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return notlar(satir["not_id"], satir["not_baslik"], satir["not_detay"],
          satir["not_tarih"]);
    });
  }

  Future<void> Notekle(
      String not_baslik, String not_detay, String not_tarih) async {
    var db = await VeritabaniYardimcisi2.veritabanierisim();

    var bilgiler = Map<String, dynamic>();

    bilgiler["not_baslik"] = not_baslik;
    bilgiler["not_detay"] = not_detay;
    bilgiler["not_tarih"] = not_tarih;

    await db.insert("notlar", bilgiler);
  }

  Future<void> Notsil(int not_id) async {
    var db = await VeritabaniYardimcisi2.veritabanierisim();

    await db.delete("notlar", where: "not_id=?", whereArgs: [not_id]);
  }

  Future<void> NotGuncelle(
      int not_id, String not_baslik, String not_detay, String not_tarih) async {
    var db = await VeritabaniYardimcisi2.veritabanierisim();

    var bilgiler = Map<String, dynamic>();

    bilgiler["not_baslik"] = not_baslik;
    bilgiler["not_detay"] = not_detay;
    bilgiler["not_tarih"] = not_tarih;

    await db.update("notlar", bilgiler, where: "not_id=?", whereArgs: [not_id]);
  }
}