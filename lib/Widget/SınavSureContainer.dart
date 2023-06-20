import 'package:flutter/material.dart';

class SinavSureContainer extends StatelessWidget {
  String text;

  SinavSureContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 60),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(text,style: TextStyle(color: Colors.black),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color.fromARGB(255, 242, 242, 242),
      ),
    );
  }
}
