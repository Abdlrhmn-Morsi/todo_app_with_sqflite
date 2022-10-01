import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/taske_controller.dart';
import 'custom_actions.dart';

class CustomAppbr extends StatefulWidget {
  @override
  State<CustomAppbr> createState() => _CustomAppbrState();
}

class _CustomAppbrState extends State<CustomAppbr> {
  TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
              child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/profile.png',
              fit: BoxFit.contain,
            ),
          ),),
          GetBuilder<TaskController>(
            builder: (controller) => Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.switchTheme();
                    },
                    child:  Icon(
                      size: 25,
                      Icons.dark_mode_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Delete All Tasks',
                        titleStyle: controller.getThemeFromBox()
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(color: Colors.black),
                        backgroundColor: controller.getThemeFromBox()
                            ? Colors.grey.shade900
                            : Colors.grey.shade500,
                        content: Container(),
                        barrierDismissible: false,
                        actions: [
                          CustomActions(
                            yesAction: () {
                              controller.deleteAllTaske();
                              Navigator.of(context).pop();
                            },
                            noAction: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                    child: Icon(
                      size: 25,
                      Icons.clear,
                      color: Colors.red.shade900,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
