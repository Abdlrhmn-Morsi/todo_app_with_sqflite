import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  bool isLineThrough;
  CustomText({
    Key? key,
    this.isLineThrough =false,
    required this.text,
   
    this.fontSize = 16,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: fontSize,
          decoration:isLineThrough? TextDecoration.lineThrough:null,
        ));
  }
}
