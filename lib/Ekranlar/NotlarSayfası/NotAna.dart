import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/NotAl.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/NotDetay.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/Notlar.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/notlardao.dart';

class NotAna extends StatefulWidget {
  @override
  State<NotAna> createState() => _NotAnaState();
}

class _NotAnaState extends State<NotAna> {
  Future<List<notlar>> Tumnotlar() async {
    var Notlist = await notlardao().TumNotlar();

    return Notlist;
  }

  Future<void> sil(int not_id) async {
    await notlardao().Notsil(not_id);
    Navigator.push(context, MaterialPageRoute(builder: (context) => NotAna()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YAPILACAKLAR"),
      ),
      body: FutureBuilder<List<notlar>>(
          future: Tumnotlar(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var Notlist = snapshot.data;
              return ListView.builder(
                  itemCount: Notlist!.length,
                  itemBuilder: (context, indeks) {
                    var Not = Notlist[indeks];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 205, 186, 150),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            Not.not_baslik,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          subtitle: Text(Not.not_tarih),
                          leading: const Icon(Icons.edit_note_outlined,
                              color: Colors.black),
                          trailing: PopupMenuButton(
                            child: const Icon(Icons.open_in_new),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 1,
                                child: Text(
                                  "Sil",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              const PopupMenuItem(
                                value: 2,
                                child: Text(
                                  "Güncelle",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                            onCanceled: () {
                              print("Seçim yapılmadı");
                            },
                            onSelected: (MenuItemValue) {
                              if (MenuItemValue == 1) {
                                sil(Not.not_id);
                              } else if (MenuItemValue == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NotDetay(Not)));
                              }
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotDetay(Not)));
                          },
                        ),
                      ),
                    );
                  });
            } else {
              return const Center();
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 205, 186, 150),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => NotAl()));
        },
        tooltip: 'Not Al',
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
