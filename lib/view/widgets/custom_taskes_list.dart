import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/model/db_model.dart';
import '../../controller/taske_controller.dart';
import 'custom_task.dart';

class CustomTaskesList extends StatelessWidget {
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (controller) => Expanded(
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: controller.getThemeFromBox()
                  ? Colors.grey.shade900
                  : Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade900, width: 2),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: controller.getThemeFromBox()
                      ? Colors.grey.shade700
                      :  Colors.grey.shade400,
                  offset: const Offset(5, 5),
                ),
                BoxShadow(
                  blurRadius: 10,
                  color: controller.getThemeFromBox()
                      ? Colors.grey.shade700
                      :  Colors.grey.shade400,
                  offset: const Offset(-5, -5),
                ),
              ]),
          child: FutureBuilder<List<Task>>(
            future: controller.getAllTaskes(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
              if (snapshot.data == null) {
                return const Center(child: Text('null'));
              }
              List<Task> tasksList = snapshot.data;
              return ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: tasksList.length,
                itemBuilder: (ctx, i) {
                  controller.index.value = i;
                  return CustomTaske(
                    id: tasksList[i].id,
                    index: i,
                    isDone: tasksList[i].isDone!,
                    title: tasksList[i].title.toString(),
                    date: tasksList[i].dateTimeCreated,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
