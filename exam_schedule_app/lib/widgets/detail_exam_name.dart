import 'package:flutter/material.dart';

class DetailExamName extends StatelessWidget {
  final String name;

  const DetailExamName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.school, color: Color.fromARGB(255, 5, 65, 129)),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              name.toUpperCase(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 5, 65, 129),
              ),
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
