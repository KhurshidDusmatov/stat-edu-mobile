import 'package:flutter/material.dart';
import 'package:rttrm_task_app/set_up.dart';
import 'package:rttrm_task_app/view/higher_edu/higher_edu.dart';
void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stat Edu Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Color(0xffF0F3F7),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HigherEducationPage(),
    );
  }
}

