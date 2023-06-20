import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedefim/Ekranlar/DenemeAnalizi.dart';
import 'package:hedefim/Ekranlar/Dersler.dart';
import 'package:hedefim/Ekranlar/NotlarSayfas%C4%B1/NotAna.dart';
import 'package:hedefim/Ekranlar/Web_Site_Ekrani.dart';
import 'package:hedefim/Service/Provider.dart';
import 'package:hedefim/Widget/ContainerSelect.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/MyDrawer.dart';
import 'package:hedefim/Widget/Sayfa_1_Container.dart';
import 'package:provider/provider.dart';

class Gecis_1 extends StatefulWidget {
  User? user;

  Gecis_1(this.user, {Key? key}) : super(key: key);

  @override
  State<Gecis_1> createState() => _Gecis_1State();
}

class _Gecis_1State extends State<Gecis_1> {
  TextEditingController textUni = TextEditingController();
  TextEditingController textBolum = TextEditingController();
  String? _kullaniciAdi;
  String secilen = "HEDEFİNİZDEKİ ÜNİVERSİTE";
  String secilen1 = "HEDEFİNİZDEKİ BÖLÜM";
  String? hedefUniversite;
  String? hedefBolum;

  _showDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("HEDEFİNİ SEÇ"),
          content: Container(
            width: 150,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textUni,

                    decoration: InputDecoration(
                      hintText: "Üniversite",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: textBolum,

                    decoration: InputDecoration(
                      hintText: "Bölüm",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            EleButtonPro(Text("KAPAT"), () {
              Navigator.pop(context);
            }),
            EleButtonPro(Text("SEÇ"), () {
              _saveDataToFirebase();
              Navigator.pop(context);
            }),
          ],
        );
      },
    );
  }

  _saveDataToFirebase() {
    String universite = textUni.text;
    String bolum = textBolum.text;

    if (universite.isNotEmpty && bolum.isNotEmpty) {
      var collection = FirebaseFirestore.instance.collection('hedef');
      collection.doc(widget.user!.uid).set({
        'üniversite': universite,
        'bölüm': bolum,
      }).then((value) {
        print('Data saved successfully!');
      }).catchError((error) {
        print('Failed to save data: $error');
      });
    }
  }

  void getHedefData() {
    var collection = FirebaseFirestore.instance.collection('hedef');
    collection.doc(widget.user!.uid).get().then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          hedefUniversite = snapshot.data()?['üniversite'];
          hedefBolum = snapshot.data()?['bölüm'];
        });
      }
    }).catchError((error) {
      print('Failed to get hedef data: $error');
    });
  }

  firebaseData(User? user) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var email = data['email'];
      var kullaniciadi = data['firstname'];

      if (email == user?.email) {
        return kullaniciadi;
      }
    }
    return null;
  }

  int Tyt() {
    DateTime bugun = DateTime.now(); // Bugünün tarihi
    DateTime seciliTarih = DateTime(2024, 6, 17); // Seçili tarih

    Duration fark = seciliTarih.difference(bugun);
    int tyt = fark.inDays;

    return tyt;
  }

  int Ayt() {
    DateTime bugun = DateTime.now(); // Bugünün tarihi

    DateTime seciliTarih2 = DateTime(2024, 6, 18); // Seçili tarih

    Duration fark2 = seciliTarih2.difference(bugun);
    int ayt = fark2.inDays;

    return ayt;
  }

  @override
  void initState() {
    super.initState();
    firebaseData(widget.user).then((kullaniciadi) {
      setState(() {
        _kullaniciAdi = kullaniciadi;
      });
    });
    getHedefData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MERHABA, ${_kullaniciAdi ?? ''}"),
        backgroundColor: Color.fromARGB(255, 205, 186, 150),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.dark_mode_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
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
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.all(12.0),
                    child: ContainerSelect(
                      secilen: hedefUniversite ?? secilen.toUpperCase(),
                      secilen1: hedefBolum ?? secilen1.toUpperCase(),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  width: 200,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "<<<<<< HAYALLERİN İÇİN ÇABALA >>>>>>",
                          style: TextStyle(fontSize: 18, color: Colors.teal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "TYT SINAVINA KALAN : ${Tyt().toString()} GÜN",
                          style: TextStyle(fontSize: 22, color: Colors.teal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "AYT SINAVINA KALAN : ${Ayt().toString()} GÜN",
                          style: TextStyle(fontSize: 22, color: Colors.teal),
                        ),
                      ),
                    ],
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Web_Site_Ekrani()));
                  }),
                  Sayfa_1_Container(Icons.list_alt, "YAPILACAKLAR", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NotAna()));
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
