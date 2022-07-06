import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo/healper/themes.dart';
import 'package:todo/view/home_view.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/taske_controller.dart';

void main()async {
  await GetStorage.init();
  TaskController controller =Get.put(TaskController());
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const  SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
    TaskController controller =Get.find();


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:Themes.light,
      darkTheme: Themes.dark,
      themeMode:controller.theme,
      home: HomeView(),
    );
  }
}
