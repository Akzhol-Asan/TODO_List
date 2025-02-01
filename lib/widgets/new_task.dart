import 'package:flutter/material.dart';
import 'package:to_do_list/helpers/format_datetime.dart';
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
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();

  final dateController = TextEditingController();
  final timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    final doneTime = DateTime.now();

    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTimeOfDay.hour,
      selectedTimeOfDay.minute,
    );
    final newTask = Task(
      title: title,
      deadLine: dateTime,
      doneTime: formatDateTime(doneTime),
    );
    widget.onTaskCreated(newTask);
    Navigator.pop(context);
  }

  void onDateTap() async {
    final now = DateTime.now();
    final firstDate =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    final dateFromUser = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDate,
    );

    if (dateFromUser != null) {
      setState(() {
        selectedDate = dateFromUser;
        dateController.text = formatDate(dateFromUser);
      });
    }
  }

  void onTimeTap() async {
    final now = TimeOfDay.now();

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDay,
    );

    if (pickedTime != null) {
      if (pickedTime.hour < now.hour ||
          (pickedTime.hour == now.hour && pickedTime.minute < now.minute)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You cant pick a Deadline Time in past!')),
          );
        }
      } else {
        setState(() {
          selectedTimeOfDay = pickedTime;
          timeController.text = formatTime(pickedTime);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        height: 300,
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
                readOnly: true,
                controller: dateController,
                onTap: onDateTap,
                onChanged: (value) => setState(() {
                  deadLine = value;
                }),
                decoration: InputDecoration(label: Text('Deadline Date')),
              ),
            ),
            Expanded(
              child: TextField(
                onTap: onTimeTap,
                readOnly: true,
                controller: timeController,
                onChanged: (value) => setState(() {
                  deadLine = value;
                }),
                decoration: InputDecoration(label: Text('Deadline Time')),
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
