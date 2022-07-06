import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/model/db_model.dart';
import 'package:todo/view/widgets/custom_appbar.dart';
import 'package:todo/view/widgets/add_task.dart';
import 'package:todo/view/widgets/custom_taskes_list.dart';
import '../controller/taske_controller.dart';
import 'widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (controller) => Scaffold(
        backgroundColor:
            controller.getThemeFromBox() ? Colors.black : Colors.grey.shade200,
        body: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              CustomAppbr(),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: controller.getThemeFromBox()
                          ? Colors.black
                          : Colors.grey.shade300,
                      shape: BoxShape.circle,
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
                    child: FutureBuilder<List<Task>>(
                        future: controller.getAllTaskes(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          }
                          if (snapshot.data == null) {
                            return const Center(child: Text('null'));
                          }
                          return CustomText(
                            text: '${snapshot.data!.length}',
                            fontSize: 20,
                          );
                        }),
                  ),
                  const SizedBox(width: 10),
                  CustomText(text: 'Taskes', fontSize: 22),
                ],
              ),
              const SizedBox(height: 15),
              CustomTaskesList(),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: controller.getThemeFromBox()
                ? Colors.grey.shade400
                : Colors.grey.shade500,
                 
            onPressed: () {
              Get.bottomSheet(addTask());
            },
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
