import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/DerslerAyt.dart';
import 'package:hedefim/Ekranlar/DerslerTyt.dart';


class Dersler extends StatefulWidget {
  const Dersler({Key? key}) : super(key: key);

  @override
  State<Dersler> createState() => _DerslerState();
}

class _DerslerState extends State<Dersler> {
  var dersler = ["TYT", "AYT"];
  var secilen = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OTURUMLAR"),
      ),
      body: ListView.builder(
        itemCount: dersler.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (dersler[index] == "TYT") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DerslerTyt()));
              } else if (dersler[index] == "AYT") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DerslerAyt()));
              }
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Text(dersler[index]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
