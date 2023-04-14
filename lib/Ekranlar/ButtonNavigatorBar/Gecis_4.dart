import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:hedefim/Widget/SettingContainer.dart';



class Gecis_4 extends StatefulWidget {
  const Gecis_4({Key? key}) : super(key: key);

  @override
  State<Gecis_4> createState() => _Gecis_4State();
}

class _Gecis_4State extends State<Gecis_4> {
  bool light = false;
  Color? renk;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HESABIM"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.person,
                      size: 115,
                      color: Colors.deepPurple,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "YUSUF İKRİ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          "bilgisayarmüh@gmail.com",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 345,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blueGrey, width: 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, right: 20),
                                child: Icon(
                                  CommunityMaterialIcons.white_balance_sunny,
                                  size: 50,
                                  color: light
                                      ? renk = Colors.white
                                      : renk = Colors.yellow,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, right: 20),
                                child: Icon(
                                  CommunityMaterialIcons.moon_waning_crescent,
                                  size: 50,
                                  color: light
                                      ? renk = Colors.black54
                                      : renk = Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, right: 20),
                                child: Switch(
                                  value: light,
                                  activeColor: Colors.redAccent,
                                  onChanged: (bool value) {
                                    setState(() {
                                      light = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SettingContainer(Icons.lock_rounded, "ŞİFREMİ SIFIRLA"),
                      SettingContainer(Icons.output_sharp, "ÇIKIŞ YAP"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
