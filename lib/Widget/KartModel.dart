import 'package:flutter/material.dart';
import 'package:hedefim/Ekranlar/DerslerOrtak.dart';
import 'package:hedefim/Widget/ContainerModel.dart';


class KartModel extends StatefulWidget {
  late List<String> liste;
  late int index;
  KartModel(this.liste, this.index, {Key? key}) : super(key: key);

  @override
  State<KartModel> createState() => _KartModelState();
}

class _KartModelState extends State<KartModel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HerDers(widget.liste[widget.index])));
          });
        },
        child: ContainerModel(widget.liste, widget.index),
      ),
    );
  }
}
