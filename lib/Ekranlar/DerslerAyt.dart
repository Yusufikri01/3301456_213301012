import 'package:flutter/material.dart';
import 'package:hedefim/Widget/KartModel.dart';


class DerslerAyt extends StatefulWidget {
  const DerslerAyt({Key? key}) : super(key: key);

  @override
  State<DerslerAyt> createState() => _DerslerAytState();
}

class _DerslerAytState extends State<DerslerAyt> {
  List<String> dersler = [
    "AYT EDEBİYAT",
    "AYT SOSYAL",
    "AYT MATEMATİK",
    "AYT FEN"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AYT"),
      ),
      body: GridView.builder(
        itemCount: dersler.length,
        itemBuilder: (context, index) {
          return KartModel(dersler, index);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
      ),
    );
  }
}
