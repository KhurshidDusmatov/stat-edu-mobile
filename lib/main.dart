import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/set_up.dart';
import 'data/routes/route_helper.dart';

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Statistika',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mulish',
        scaffoldBackgroundColor: Color(0xffF0F3F7),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      getPages: RouteHelper.routes,
      initialRoute: RouteHelper.getInitial(),
    );
  }
}
