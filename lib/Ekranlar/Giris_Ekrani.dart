import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/ButtonNavigatorBar/Anasayfa.dart';
import 'package:hedefim/Ekranlar/ForgotPassword.dart';
import 'package:hedefim/Ekranlar/Kayit_Ekrani.dart';
import 'package:hedefim/Service/LoginFunction.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/TextFieldFor.dart';


class Giris_Ekrani extends StatelessWidget {

  final _tfkullaniciEmail = TextEditingController();
  final _tfkullaniciSifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage("assets/resim.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "HOŞGELDİNİZ",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              TextFieldFor(text: "E-mail",icon: Icons.person,textEditingController: _tfkullaniciEmail,see: false),
              TextFieldFor(text: "Password",icon: Icons.key,textEditingController: _tfkullaniciSifre,see: true),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                      },
                      child: Text(
                        "SİFREMİ UNUTTUM",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EleButtonPro(Text("GİRİŞ YAP"), () async {
                          User? user = await SignIn(
                              _tfkullaniciEmail, _tfkullaniciSifre, context);
                          if (user != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Anasayfa(user)));
                          }
                        })),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "HESABIN YOK MU ?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KayitEkrani()));
                      },
                      child: Text(
                        "HESAP OLUŞTUR",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
