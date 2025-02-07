import 'package:to_do_list/data/categories_data.dart';
import 'package:to_do_list/models/task_category.dart';

class Task {
  final String title;
  final DateTime deadLine;
  final String doneTime;
  final String categoryId;

  Task({
    required this.title,
    required this.doneTime,
    required this.deadLine,
    required this.categoryId,
  });

  TaskCategory get category {
    return categories.firstWhere((c) => c.id == categoryId);
  }
}
