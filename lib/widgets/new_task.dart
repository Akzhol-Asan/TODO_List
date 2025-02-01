import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';

class NewTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;

  const NewTask({
    super.key,
    required this.onTaskCreated,
  });

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var title = '';
  var deadLine = '';

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    final newTask = Task(title: title, deadline: deadLine, doneTime: '123');
    widget.onTaskCreated(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => setState(() {
                  title = value;
                }),
                decoration: InputDecoration(label: Text('Add new task')),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                onChanged: (value) => setState(() {
                  deadLine = value;
                }),
                decoration: InputDecoration(label: Text('Add Deadline')),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: onCanceled, child: Text('Cancel')),
                ),
                SizedBox(width: 16),
                Expanded(
                  child:
                      ElevatedButton(onPressed: onSaved, child: Text('Save')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
