import 'package:exam_schedule_app/models/exam_model.dart';
import 'package:flutter/material.dart';

class DetailData extends StatelessWidget {
  final Exam exam;

  const DetailData({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final currentDateTime = DateTime.now();
    Duration dateTimeUntilExam = exam.dateTime.difference(currentDateTime);

    String examStatusText;

    if (dateTimeUntilExam.isNegative) {
      examStatusText = 'Испитот заврши.';
    } else {
      final days = dateTimeUntilExam.inDays;
      final hours = dateTimeUntilExam.inHours % 24;
      examStatusText = '$days дена и $hours часа';
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 68, 140, 217),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Детали за испитот',
            style: TextStyle(
              color: Color.fromARGB(255, 5, 65, 129),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          _buildDetailRow('Предмет', exam.name),
          _buildDetailRow(
            'Датум и време',
            '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
          ),
          _buildDetailRow('Простории', exam.classrooms.join(', ')),
          _buildDetailRow('Време до испит', examStatusText),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 18)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color.fromARGB(255, 5, 65, 129),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
