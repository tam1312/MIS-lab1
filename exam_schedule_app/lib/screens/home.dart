import 'package:exam_schedule_app/data/exams_hardcoded.dart';
import 'package:exam_schedule_app/models/exam_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Exam> _exams;

  @override
  void initState() {
    super.initState();
    _exams = exams;
    _exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _exams.length,
              itemBuilder: (context, index) {
                final exam = _exams[index];
                final isOver = exam.dateTime.isBefore(DateTime.now());
                return Card(
                  color: isOver
                      ? const Color.fromARGB(255, 231, 188, 188)
                      : const Color.fromARGB(255, 198, 254, 191),
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text(exam.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 16),
                            SizedBox(width: 4),
                            Text(
                              '${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.room, size: 16),
                            SizedBox(width: 4),
                            Text(exam.classrooms.join(', ')),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/details", arguments: exam);
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            child: Text(
              'Вкупно испити: ${_exams.length}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
