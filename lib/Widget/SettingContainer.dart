import 'package:flutter/material.dart';
import 'package:hedefim/Service/LoginFunction.dart';

class SettingContainer extends StatelessWidget {
  final IconData icon;
  final String textler;
  final VoidCallback? onPrressed;

  const SettingContainer(
    this.icon,
    this.textler,
      this.onPrressed,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      textler,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: onPrressed,
                    child: Icon(Icons.navigate_next, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
