import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/higher_edu/students/students_controller.dart';

class StudentsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      init: StudentsController(),
      builder: (controller) {
        return Center(
          child: controller.studentsData.isEmpty
              ? CircularProgressIndicator()
              : Column(
            children: controller.studentsData.map((e) => Text(e)).toList(),
          ),
        );
      },
    );
  }
}
