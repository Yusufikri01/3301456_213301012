import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_2.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_3.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Gecis_4.dart';
import 'package:hedefim/Ekranlar/DenemeAnalizi.dart';
import 'package:hedefim/Ekranlar/Giris_Ekrani.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 205, 186, 150),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 205, 186, 150),
              ),
              height: 217,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(19.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/resim.jpg"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "HOSGELDİNİZ",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      "YUSUF İKRİ", // burayı da düzeltmek gerek
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 410,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16),
                //runSpacing: 16,
                children: [
                  ListTile(
                    leading: Icon(Icons.watch_later_sharp, color: Colors.black),
                    title: Text(
                      "DENEME ZAMANI",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_2()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt, color: Colors.black),
                    title: Text(
                      "YAPILACAKLAR",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_3()));
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.analytics_outlined, color: Colors.black),
                    title: Text(
                      "DENEME ANALİZİM",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DenemeAnalizi()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.black),
                    title: Text(
                      "HESABIM",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_4()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.black),
                    title: Text(
                      "ÇIKIŞ YAP",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Giris_Ekrani()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
