import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) delete;

  const TasksScreen({
    super.key,
    required this.tasks,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: tasks
              .asMap()
              .map((index, task) => MapEntry(
                  index,
                  TaskCard(
                    task: task,
                    delete: () => delete(index),
                  )))
              .values
              .toList(),
        ),
      ),
    );
  }
}
