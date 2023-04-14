import 'package:flutter/material.dart';

class Sayfa_1_Container extends StatelessWidget {
  final IconData icon;
  final String textler;
  final VoidCallback? onPressed;

  Sayfa_1_Container(
      @required this.icon, @required this.textler, @required this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            width: 100,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color.fromARGB(255, 205, 186, 150),
            ),
            margin: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(icon, color: Colors.white, size: 40),
                Text(
                  textler,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
