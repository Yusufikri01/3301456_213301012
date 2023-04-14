import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hedefim/Ekranlar/Giris_Ekrani.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';


void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  const BenimUygulamam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color.fromARGB(255, 205, 186, 150),
          ),
          scaffoldBackgroundColor: Color.fromARGB(255, 192, 204, 192),
        ),
        debugShowCheckedModeBanner: false,
        home: BenimUygulamam_2());
  }
}

class BenimUygulamam_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
                child: Center(
                    child: Text(
                  "HEP BERABER BU MACERAYA BAŞLAYALIM MI ?",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
              ),
            ),
            EleButtonPro(
              Text("MACERAYA BAŞLA"),
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Giris_Ekrani())),
            ),
          ],
        ),
      ),
    );
  }
}
