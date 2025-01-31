import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/widgets/button_delete.dart';
import 'package:to_do_list/widgets/button_done.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodySmallStyle = theme.textTheme.bodySmall;

    return Card(
      color: Color.fromRGBO(72, 72, 72, 1),
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
                        child: Text(task.title,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text(task.deadline,
                          style: bodySmallStyle!.copyWith(
                            color: Colors.white,
                          )),
                      Text(task.doneTime,
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
                  ButtonDone(text: 'Done'),
                  SizedBox(width: 10),
                  ButtonDelete(text: 'Delete'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
