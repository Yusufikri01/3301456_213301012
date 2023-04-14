import 'package:flutter/material.dart';

class TextFormFieldPro extends StatelessWidget {
  final TextEditingController? control;
  final String text;

  TextFormFieldPro(this.control, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 242, 242, 242), //kırık beyaz
          borderRadius: BorderRadius.circular(60),
        ),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 10, right: 10, top: 0.5, bottom: 0.5),
        child: TextFormField(
          controller: control,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
            labelText: text,
          ),
          validator: (deyer) {
            if (deyer == null || deyer.isEmpty) {
              return "BOŞ GEÇİLMEZ";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
