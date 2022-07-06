import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/taske_controller.dart';
import 'package:todo/view/widgets/custom_text.dart';

class EditeTask extends StatelessWidget {
  var index;
  var id;
  EditeTask({
    Key? key,
    required this.index,
    required this.id,
  }) : super(key: key);

  final TaskController controller = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    controller.titleController.text = controller.taskes[index].title.toString();

    return GetBuilder<TaskController>(
      builder: (controller) => Container(
        height: 200,
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
                  text: 'Edite Task',
                  fontSize: 30,
                ),
              ),
              TextField(
                style: const TextStyle(color: Colors.white, fontSize: 22),
                controller: controller.titleController,
                autofocus: true,
                cursorColor: Colors.white,
                textAlign: TextAlign.center,
                decoration: InputDecoration(),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  controller.editeTaske(id);
                  Navigator.of(context).pop();
                },
                child: CustomText(
                  text: 'Edite',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
