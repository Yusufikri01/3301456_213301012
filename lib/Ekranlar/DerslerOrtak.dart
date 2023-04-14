import 'package:flutter/material.dart';
import 'package:hedefim/Classlar/Konular.dart';
import 'package:hedefim/Widget/ContainerModel.dart';



class HerDers extends StatefulWidget {
  String text;
  HerDers(this.text, {Key? key}) : super(key: key);

  @override
  State<HerDers> createState() => _HerDersState();
}

class _HerDersState extends State<HerDers> {
  Konular ders = Konular();
  List<String> veri = [];

  void veriliste() {
    if (widget.text == "TYT TÜRKÇE") {
      veri = ders.tytturkce;
    } else if (widget.text == "TYT SOSYAL") {
      veri = ders.tytsosyal;
    } else if (widget.text == "TYT MATEMATİK") {
      veri = ders.tytmatematik;
    } else if (widget.text == "TYT FEN") {
      veri = ders.tytfen;
    }
  }

  @override
  void initState() {
    super.initState();
    veriliste();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: GridView.builder(
        itemCount: veri.length,
        itemBuilder: (context, index) {
          return ContainerModel(veri, index);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
      ),
    );
  }
}
