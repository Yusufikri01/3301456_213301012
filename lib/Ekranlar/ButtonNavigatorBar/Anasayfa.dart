import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_1.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_2.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_3.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_4.dart';


class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var SayfaListesi = [
    Gecis_1(),
    Gecis_2(),
    Gecis_3(),
    Gecis_4(),
  ];

  int secilenindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SayfaListesi[secilenindex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 205, 186, 150),
            ),
            label: "ANASAYFA",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.timelapse_outlined,
                  color: Color.fromARGB(255, 205, 186, 150)),
              label: "ZAMANLAYICI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month,
                  color: Color.fromARGB(255, 205, 186, 150)),
              label: "YAPILACAKLAR"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box,
                  color: Color.fromARGB(255, 205, 186, 150)),
              label: "HESABIM"),
        ],
        selectedItemColor:
            Colors.blueGrey, // BOTTOMNAVİGATORBAR AŞAGIDAKİ YAZI RENGİ
        unselectedItemColor: Colors.teal,
        currentIndex: secilenindex,
        onTap: (index) {
          setState(() {
            secilenindex = index;
          });
        },
      ),
    );
  }
}
