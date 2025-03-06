import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rttrm_task_app/controller/higher_edu/teachers/teachers_controller.dart';

class TeachersTab extends StatelessWidget {
  const TeachersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachersController>(
      init: TeachersController(),
      builder: (controller) {
        return Center(
          child: controller.teachersData.isEmpty
              ? CircularProgressIndicator()
              : Column(
            children: controller.teachersData.map((e) => Text(e)).toList(),
          ),
        );
      },
    );
  }
}

