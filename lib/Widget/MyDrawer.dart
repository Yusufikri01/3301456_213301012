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
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 205, 186, 150),
              ),
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                      "YUSUF İKRİ",
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
              child: Wrap(
                runSpacing: 16,
                children: [
                  ListTile(
                    leading: Icon(Icons.watch_later_sharp),
                    title: Text("DENEME ZAMANI"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_2()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt),
                    title: Text("YAPILACAKLAR"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_3()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.analytics_outlined),
                    title: Text("DENEME ANALİZİM"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DenemeAnalizi()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("HESABIM"),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Gecis_4()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text("ÇIKIŞ YAP"),
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
