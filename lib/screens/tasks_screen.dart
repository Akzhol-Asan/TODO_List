import 'package:flutter/material.dart';
import 'package:to_do_list/data/categories_data.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/task_card.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function(int) delete;
  final Function(String?) onCategorySelected;

  const TasksScreen({
    super.key,
    required this.tasks,
    required this.delete,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: DropdownMenu(
                  expandedInsets: EdgeInsets.zero,
                  label: Text(
                    'Category',
                    style: TextStyle(color: Colors.grey),
                  ),
                  initialSelection: 'all',
                  onSelected: onCategorySelected,
                  dropdownMenuEntries: allCategories
                      .map((category) => DropdownMenuEntry(
                            value: category.id,
                            label: category.title,
                            leadingIcon: Icon(
                              category.icon,
                            ),
                          ))
                      .toList(),
                  textStyle: TextStyle(color: Colors.green.shade600),
                ),
              ),
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
