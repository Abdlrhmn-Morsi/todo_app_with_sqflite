import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/taske_controller.dart';

class CustomActions extends StatelessWidget {
  TaskController controller = Get.find();
  dynamic yesAction;
  dynamic noAction;
  CustomActions({
    Key? key,
    required this.yesAction,
    required this.noAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: yesAction,
            child: const Text(
              ' Yes',
              style: TextStyle(color: Colors.red),
            )),
        TextButton(
            onPressed: noAction,
            child: Text(
              ' No',
              style: TextStyle(
                color:
                    controller.getThemeFromBox() ? Colors.white : Colors.black,
              ),
            )),
      ],
    );
  }
}
