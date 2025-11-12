import 'package:exam_schedule_app/models/exam_model.dart';
import 'package:flutter/material.dart';

import 'package:exam_schedule_app/widgets/detail_data.dart';
import 'package:exam_schedule_app/widgets/detail_exam_name.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 220, 245),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 16.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DetailExamName(name: exam.name),
            const SizedBox(height: 30),
            DetailData(exam: exam),
          ],
        ),
      ),
    );
  }
}
