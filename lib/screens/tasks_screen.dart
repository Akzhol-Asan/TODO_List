import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;

  const TasksScreen({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: tasks.map((task) => TaskCard(task: task)).toList(),
        ),
      ),
    );
  }
}
