import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/taske_controller.dart';
import 'package:todo/view/widgets/custom_text.dart';
import 'custom_actions.dart';
import 'edite_task.dart';

class CustomTaske extends StatelessWidget {
  TaskController controller = Get.find();
  dynamic id;
  dynamic index;
  dynamic title;
  dynamic date;
  bool isDone;

  CustomTaske({
    Key? key,
    required this.isDone,
    required this.title,
    required this.date,
    required this.id,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GetBuilder<TaskController>(
        builder: (controller) => Checkbox(
          checkColor:
              controller.getThemeFromBox() ? Colors.black : Colors.white,
          activeColor:
              controller.getThemeFromBox() ? Colors.white : Colors.black,
          visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          value: isDone,
          onChanged: (v) async {
            controller.updateCheck(id, v!, title);
          },
        ),
      ),
      title: GetBuilder<TaskController>(
        builder: (controller) => GestureDetector(
          onTap: () {
            Get.bottomSheet(EditeTask(
              index: index,
              id: id,
            ));
          },
          onLongPress: () {
            Get.defaultDialog(
              title: 'Delete Task',
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
                    controller.deleteTaske(id);
                    Navigator.of(context).pop();
                  },
                  noAction: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
          child: CustomText(text: title, isLineThrough: isDone),
        ),
      ),
      subtitle: GestureDetector(
        onTap: () {
          Get.bottomSheet(EditeTask(
            index: index,
            id: id,
          ));
        },
        onLongPress: () {
          Get.defaultDialog(
            title: 'Delete Task',
            titleStyle: const TextStyle(color: Colors.white),
            backgroundColor: Colors.indigo,
            content: Container(),
            barrierDismissible: false,
            actions: [
              CustomActions(
                yesAction: () {
                  controller.deleteTaske(id);
                  Navigator.of(context).pop();
                },
                noAction: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
        child: CustomText(
          text: date,
        ),
      ),
    );
  }
}
