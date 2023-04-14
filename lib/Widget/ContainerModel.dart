import 'package:flutter/material.dart';


class ContainerModel extends StatelessWidget {
  final List<String> liste;
  final int index;
  const ContainerModel(this.liste,this.index,{Key? key,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: Text(liste[index].toUpperCase()),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 242, 242),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.blueGrey, width: 1),
        ),
      ),
    );
  }
}