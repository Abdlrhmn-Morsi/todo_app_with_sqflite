import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/taske_controller.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  bool isLineThrough;
  CustomText({
    Key? key,
    this.isLineThrough = false,
    required this.text,
    this.fontSize = 16,
  }) : super(key: key);
  TaskController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: controller.getThemeFromBox() ? Colors.white : Colors.black,
        fontSize: fontSize,
        decoration: isLineThrough ? TextDecoration.lineThrough : null,
      ),
    );
  }
}
