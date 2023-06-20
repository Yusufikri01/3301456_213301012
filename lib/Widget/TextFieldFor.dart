import 'package:flutter/material.dart';

class TextFieldFor extends StatefulWidget {
  final String? text;
  final IconData? icon;
  final TextEditingController? textEditingController;
  final bool? see;

  TextFieldFor({
    Key? key,
    this.text,
    this.icon,
    this.textEditingController,
    this.see,
  }) : super(key: key);

  @override
  _TextFieldForState createState() => _TextFieldForState();
}

class _TextFieldForState extends State<TextFieldFor> {
  bool _isPasswordVisible = false;

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
        obscureText: widget.see! ? !_isPasswordVisible : _isPasswordVisible,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon: widget.see!
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          prefixIcon: Icon(widget.icon),
          border: InputBorder.none,
          hintText: widget.text,
          labelText: widget.text,
        ),
      ),
    );
  }
}
