import 'package:flutter/material.dart';

class TextFieldFor extends StatelessWidget {
  final String text;
  final IconData icon;

  TextFieldFor(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 0.5, bottom: 1),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          hintText: text,
          labelText: text,
        ),
      ),
    );
  }
}
