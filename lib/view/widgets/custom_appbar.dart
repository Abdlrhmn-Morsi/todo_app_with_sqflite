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
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.getThemeFromBox()
                  ? Colors.black
                  : Colors.grey.shade300,
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.white.withOpacity(0.2),
                  offset: const Offset(2, 2),
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.white.withOpacity(0.2),
                  offset: const Offset(-2, -2),
                ),
              ],
            ),
            child: const Icon(
              Icons.trending_up_outlined,
            ),
          ),
          GetBuilder<TaskController>(
            builder: (controller) => Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('prresed');
                      controller.switchTheme();
                    },
                    child: Icon(
                      size: 25,
                      Icons.dark_mode_outlined,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Delete All Tasks',
                        titleStyle:controller.getThemeFromBox()? TextStyle(color: Colors.white):TextStyle(color: Colors.black),
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
