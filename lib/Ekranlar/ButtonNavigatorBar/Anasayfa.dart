import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_1.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_2.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_3.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_4.dart';


class Anasayfa extends StatefulWidget {
  User? user;

  Anasayfa(this.user,{Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  late List<Widget> sayfaListesi;
  int secilenIndex = 0;

  @override
  void initState() {
    super.initState();
    sayfaListesi = [
      Gecis_1(widget.user),
      Gecis_2(),
      Gecis_3(),
      Gecis_4(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sayfaListesi[secilenIndex],
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
              label: "TAKVİM"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box,
                  color: Color.fromARGB(255, 205, 186, 150)),
              label: "HESABIM"),
        ],
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.teal,
        currentIndex: secilenIndex,
        onTap: (index) {
          setState(() {
            secilenIndex = index;
          });
        },
      ),
    );
  }
}

