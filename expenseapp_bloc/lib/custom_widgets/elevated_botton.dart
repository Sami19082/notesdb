import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CstmButton extends StatelessWidget {
  final String name;
  final Color btnColor;
  final Color textcolor;
  Widget? mWidget;
  final VoidCallback onTap;

  CstmButton(
      {required this.name,
        required this.btnColor,
        required this.textcolor,
        this.mWidget,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: btnColor),
        child: mWidget ??
            Text(
              name,
              style: TextStyle(fontSize: 18, color: textcolor),
            ),
      ),
    );
  }
}
