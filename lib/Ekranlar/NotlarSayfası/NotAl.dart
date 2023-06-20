import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/NotAna.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/notlardao.dart';
import 'package:hedefim/Widget/TextFieldFor.dart';

class NotAl extends StatefulWidget {
  const NotAl({Key? key}) : super(key: key);

  @override
  State<NotAl> createState() => _NotAlState();
}

class _NotAlState extends State<NotAl> {
  var tfNotbaslik = TextEditingController();
  var tfNotDetay = TextEditingController();
  var tfNotTarih = TextEditingController();

  Future<void> ekle() async {
    await notlardao()
        .Notekle(tfNotbaslik.text, tfNotDetay.text, tfNotTarih.text);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NotAna()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Not Al"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextFieldFor(
                  text: "Başlık",
                  icon: Icons.title,
                  textEditingController: tfNotbaslik,
                  see: false),
              TextFieldFor(
                  text: "Detay",
                  icon: Icons.title,
                  textEditingController: tfNotDetay,
                  see: false),
              TextFieldFor(
                  text: "Tarih",
                  icon: Icons.calendar_month,
                  textEditingController: tfNotTarih,
                  see: false),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 205, 186, 150),
        onPressed: () {
          ekle();
        },
        tooltip: 'Not Al',
        label: const Text("KAYDET"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
