import 'package:flutter/material.dart';

class EleButtonPro extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  EleButtonPro(this.child, this.onPressed); //final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 205, 186, 150),
          shadowColor: Colors.red,
          elevation: 5,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
      onPressed: onPressed,
      child: child,
    );
  }
}
