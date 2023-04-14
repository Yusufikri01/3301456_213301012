import 'package:flutter/material.dart';
import 'package:hedefim/Widget/KartModel.dart';

class DerslerTyt extends StatefulWidget {
  const DerslerTyt({Key? key}) : super(key: key);

  @override
  State<DerslerTyt> createState() => _DerslerTytState();
}

class _DerslerTytState extends State<DerslerTyt> {
  List<String> dersler = [
    "TYT TÜRKÇE",
    "TYT SOSYAL",
    "TYT MATEMATİK",
    "TYT FEN"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TYT"),
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
