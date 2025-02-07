import 'package:flutter/material.dart';
import 'package:to_do_list/helpers/format_datetime.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/button_delete.dart';
import 'package:to_do_list/widgets/button_done.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback delete;

  const TaskCard({
    super.key,
    required this.task,
    required this.delete,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool taskCompleted = false;
  DateTime? doneAt;

  void doneIsClicked(bool newValue) {
    setState(() {
      taskCompleted = newValue;
      doneAt = newValue ? DateTime.now() : null;
    });
  }

  Color cardColor() {
    if (doneAt == null) {
      return Color.fromRGBO(72, 72, 72, 1);
    } else if (doneAt!.isAfter(widget.task.deadLine)) {
      return Color.fromRGBO(98, 50, 46, 1);
    } else {
      return Color.fromRGBO(54, 91, 77, 1);
    }
  }

  Color borderColor() {
    if (doneAt == null) {
      return Color.fromRGBO(72, 72, 72, 1);
    } else if (doneAt!.isAfter(widget.task.deadLine)) {
      return Color.fromRGBO(191, 71, 61, 1);
    } else {
      return Color.fromRGBO(79, 173, 136, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodySmallStyle = theme.textTheme.bodySmall;

    return Card(
      color: cardColor(),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor(), width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          widget.task.title,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 8),
                          child: Row(
                            children: [
                              Icon(
                                widget.task.category.icon,
                                size: 16,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.task.category.title,
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Deadline: ${formatDateTime(widget.task.deadLine)}',
                        style: bodySmallStyle!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        doneAt != null
                            ? 'Done: ${formatDateTime(doneAt!)}'
                            : 'in Progress',
                        style: bodySmallStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.more_vert)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonDone(text: 'Done', doneIsClicked: doneIsClicked),
                  SizedBox(width: 10),
                  ButtonDelete(
                    text: 'Delete',
                    delete: widget.delete,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
