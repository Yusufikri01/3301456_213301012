import 'package:flutter/material.dart';
import 'package:hedefim/Widget/Ele_Button_Proporties.dart';
import 'package:hedefim/Widget/TextFormFieldPro.dart';


class KayitEkrani extends StatefulWidget {
  const KayitEkrani({Key? key}) : super(key: key);

  @override
  State<KayitEkrani> createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final formKey = GlobalKey<FormState>();
  final _tfkullaniciAd = TextEditingController();
  final _tfkullaniciSoyad = TextEditingController();
  final _tfkullaniciEmail = TextEditingController();
  final _tfkullaniciSifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(42.0),
                child: Text(
                  "KAYIT OL",
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child:
                                  TextFormFieldPro(_tfkullaniciAd, "ADINIZ")),
                          Expanded(
                              child: TextFormFieldPro(
                                  _tfkullaniciSoyad, "SOYADINIZ")),
                        ],
                      ),
                      TextFormFieldPro(_tfkullaniciEmail, "E POSTA"),
                      TextFormFieldPro(_tfkullaniciSifre, "ŞİFRE"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EleButtonPro(Text("GERİ"), () {
                              Navigator.pop(context);
                            }),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: EleButtonPro(
                                Text("KAYDET"),
                                () {
                                  if (formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('KAYIT BAŞARILI.'),
                                      ),
                                    );
                                  }
                                },
                              )),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
