import 'package:flutter/material.dart';

class ContainerSelect extends StatelessWidget {
  const ContainerSelect({
    Key? key,
    required this.secilen,
    required this.secilen1,
  }) : super(key: key);

  final String secilen;
  final String secilen1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$secilen " ,style: TextStyle(fontSize: 20,color: Colors.teal),), // KAYIT EKRANINDAN ALDIGIMIZ ÜNİVERSİTEYİ BURAYA YAZACAGIZ
        Text(secilen1,style: TextStyle(fontSize: 20,color: Colors.teal),), // KAYIT EKRANINDAN ALDIGIMIZ BÖLÜMÜ BURAYA YAZACAGIZ
      ],
    );
  }
}