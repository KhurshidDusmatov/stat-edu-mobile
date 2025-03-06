import 'package:flutter/material.dart';
import 'package:rttrm_task_app/view/higher_edu/tabs/general_tab.dart';
import 'tabs/students_tab.dart';
import 'tabs/teachers_tab.dart';

class HigherEducationPage extends StatelessWidget {
  const HigherEducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        GeneralTab(),
        StudentsTab(),
        TeachersTab(),
      ],
    );
  }
}
