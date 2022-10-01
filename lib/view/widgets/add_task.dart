import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/taske_controller.dart';
import 'package:todo/view/widgets/custom_text.dart';

class addTask extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    controller.titleController.text = '';

    return GetBuilder<TaskController>(
      builder: (controller) => Container(
        height: 183,
        decoration: BoxDecoration(
          color: controller.getThemeFromBox()
              ? Colors.grey.shade900
              : Colors.grey.shade500,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: 'Add Task',
                  fontSize: 30,
                ),
              ),
              TextField(
                style: TextStyle(
                    color: controller.getThemeFromBox()
                        ? Colors.white
                        : Colors.black,
                    fontSize: 22),
                controller: controller.titleController,
                autofocus: true,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: controller.getThemeFromBox()
                        ? Colors.grey.shade700
                        : Colors.grey.shade100),
                onPressed: () {
                  if (controller.titleController.text.isEmpty) {
                    Get.snackbar(
                        'Please add Task',
                        colorText: Colors.white,
                        DateFormat("MMM dd  HH:mm").format(DateTime.now()));
                  } else {
                    controller.addTaskController();
                    Navigator.of(context).pop();
                  }
                },
                child: CustomText(
                  text: 'Add',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
