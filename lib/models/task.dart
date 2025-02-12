import 'package:to_do_list/data/categories_data.dart';
import 'package:to_do_list/models/task_category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Task {
  final String id;
  final String title;
  final DateTime deadLine;
  final String doneTime;
  final String categoryId;

  Task({
    required this.title,
    required this.doneTime,
    required this.deadLine,
    required this.categoryId,
  }) : id = uuid.v4();

  TaskCategory get category {
    return categories.firstWhere((c) => c.id == categoryId);
  }
}
