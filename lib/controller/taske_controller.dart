import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:todo/db/db.dart';
import 'package:todo/model/db_model.dart';

class TaskController extends GetxController {
  RxInt index = 0.obs;
  RxBool isDoneController = false.obs;
  bool isDarkModeController = false;
  final titleController = TextEditingController();

  addTaskController() async {
    var title = titleController.value.text;
    if (title.isEmpty) {
      title = 'no name';
    }
    Task task = Task(
      title: title,
      isDone: false,
      dateTimeCreated: DateFormat("MMM dd  HH:mm").format(DateTime.now()),
    );

    await DbHealper.db.addTask(task);
    await getAllTaskes();
    update();
  }

  updateCheck(dynamic id, bool value, dynamic title) async {
    Task task = Task(
      id: id,
      title: title,
      isDone: value,
      dateTimeCreated: DateFormat("MMM dd  HH:mm").format(DateTime.now()),
    );

    await DbHealper.db.updateTask(task);
    getAllTaskes();
    update();
  }

  editeTaske(dynamic id) async {
    var title = titleController.value.text;
    Task task = Task(
      id: id,
      title: title,
      isDone: false,
      dateTimeCreated: DateFormat("MMM dd  HH:mm").format(DateTime.now()),
    );

    await DbHealper.db.updateTask(task);
    getAllTaskes();
    update();
  }

  deleteTaske(int id) async {
    var title = titleController.value.text;
    Task task = Task(
      id: id,
    );

    await DbHealper.db.deleteTask(task);
    getAllTaskes();
    update();
  }

  deleteAllTaske() async {
    await DbHealper.db.deleteAllTaskes();
    getAllTaskes();
    update();
  }

  Future<List<Task>> getAllTaskes() async {
    taskes = await DbHealper.db.getAllTaskes();
    return taskes;
  }

  List<Task> taskes = [];

///////////////DARK MODE//////////////////////////////////
  final _box = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeInBox(bool isDarkMode) => _box.write(_key, isDarkMode);
  bool getThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => getThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(getThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeInBox(!getThemeFromBox());
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllTaskes();
    update();
  }
}
