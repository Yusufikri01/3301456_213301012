import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ForgotPassword.dart';
import 'package:hedefim/Ekranlar/Giris_Ekrani.dart';
import 'package:hedefim/Widget/SettingContainer.dart';
import 'package:tuple/tuple.dart';

class Gecis_4 extends StatefulWidget {
  const Gecis_4({Key? key}) : super(key: key);

  @override
  State<Gecis_4> createState() => _Gecis_4State();
}

class _Gecis_4State extends State<Gecis_4> {
  String? _kullaniciAdi;
  String? _soyisim;

  @override
  void initState() {
    super.initState();
    firebaseData(FirebaseAuth.instance.currentUser).then((result) {
      setState(() {
        if (result != null) {
          var tuple = result as Tuple2<String, String>;
          _kullaniciAdi = tuple.item1;
          _soyisim = tuple.item2;
        }
      });
    });
  }

  Future<Tuple2<String, String>?> firebaseData(User? user) async {
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var email = data['email'];
      var kullaniciadi = data['firstname'];
      var soyisim = data['surname'];

      if (email == user?.email) {
        return Tuple2(kullaniciadi, soyisim);
      }
    }
    return null;
  }

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
                          "${_kullaniciAdi ?? ''} ${_soyisim ?? ''}",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        Text(
                          FirebaseAuth.instance.currentUser?.email ?? '',
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
                      SettingContainer(Icons.lock, "ŞİFREMİ SIFIRLA", () {
                        ForgotPassword();
                      }),
                      SettingContainer(Icons.output_sharp, "ÇIKIŞ YAP", () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Giris_Ekrani()));
                      }),
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
