import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_3.dart';
import 'package:hedefim/Ekranlar/DenemeAnalizi.dart';
import 'package:hedefim/Ekranlar/Dersler.dart';
import 'package:hedefim/Ekranlar/Web_Site_Ekrani.dart';
import 'package:hedefim/Widget/ContainerSelect.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/MyDrawer.dart';
import 'package:hedefim/Widget/Sayfa_1_Container.dart';


class Gecis_1 extends StatefulWidget {
  Gecis_1({Key? key}) : super(key: key);

  @override
  State<Gecis_1> createState() => _Gecis_1State();
}

class _Gecis_1State extends State<Gecis_1> {
  List<String> items = ["SELÇUK", "ERCİYES", "BOZOK", "İSTANBUL TEKNİK"];
  String secilen = "SELÇUK";
  List<String> items1 = [
    "BİLGİSAYAR MÜHENDİSLİĞİ",
    "MEKATRONİK MÜHENDİSLİĞİ",
    "TIP",
    "ECZACILIK"
  ];
  String secilen1 = "BİLGİSAYAR MÜHENDİSLİĞİ";

  _showDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("HEDEFİNİ SEÇ"),
            content: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: secilen,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        secilen = item!;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: secilen1,
                    items: items1
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item),
                            ))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        secilen1 = item!;
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              EleButtonPro(Text("KAPAT"), () {
                Navigator.pop(context);
              }),
              EleButtonPro(Text("SEÇ"), () {
                Navigator.pop(context);
              }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MERHABA, YUSUF "),
        backgroundColor: Color.fromARGB(255, 205, 186, 150),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  onTap: _showDialog,
                  child: Container(
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0)),
                      margin: EdgeInsets.all(12.0),
                      child: ContainerSelect(
                          secilen: secilen, secilen1: secilen1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  width: 200,
                  height: 125,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)),
                  margin: EdgeInsets.all(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      // BURAYA İNTERNET ÜZERİNDEN ÇEKTİGİMİZ SÖZLER GELECEK.
                      "Sıkı bir çalışmanın yerini hiç bir şey alamaz. Deha yüzde bir ilham ve yüzde doksan dokuz terdir.",
                      style: TextStyle(fontSize: 20, color: Colors.teal),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Sayfa_1_Container(Icons.play_lesson, "DERSLER", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dersler()));
                  }),
                  Sayfa_1_Container(Icons.analytics, "DENEME ANALİZİM", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DenemeAnalizi()));
                  }),
                ],
              ),
              Row(
                children: [
                  Sayfa_1_Container(Icons.pending_actions, "NET HESAPLA", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Web_Site_Ekrani()));
                  }),
                  Sayfa_1_Container(Icons.list_alt, "YAPILACAKLAR", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Gecis_3()));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
