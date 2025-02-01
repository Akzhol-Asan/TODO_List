import 'package:flutter/material.dart';
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

  void doneIsClicked(bool newValue) {
    setState(() {
      taskCompleted = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodySmallStyle = theme.textTheme.bodySmall;

    return Card(
      color: taskCompleted
          ? Color.fromRGBO(54, 91, 77, 1)
          : Color.fromRGBO(72, 72, 72, 1),
      shape: taskCompleted
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: Colors.green.shade200, width: 1))
          : null,
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
                      Text(widget.task.deadline,
                          style: bodySmallStyle!.copyWith(
                            color: Colors.white,
                          )),
                      Text(widget.task.doneTime,
                          style: bodySmallStyle.copyWith(
                            color: Colors.white,
                          )),
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
