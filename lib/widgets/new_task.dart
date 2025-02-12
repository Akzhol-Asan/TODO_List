import 'package:flutter/material.dart';
import 'package:to_do_list/data/categories_data.dart';
import 'package:to_do_list/helpers/format_datetime.dart';
import 'package:to_do_list/models/task.dart';

class NewTask extends StatefulWidget {
  final void Function(Task newTask) onTaskCreated;
  final Task? existingTask;

  const NewTask({
    super.key,
    required this.onTaskCreated,
    this.existingTask,
  });

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  var selectedDate = DateTime.now();
  var selectedTimeOfDay = TimeOfDay.now();
  String? selectedCategory;

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final titleController = TextEditingController();
  final deadLineController = TextEditingController();

  bool isDateSelected = false;
  bool isTimeSelected = false;

  String deadLineClearedText = '';

  @override
  void initState() {
    super.initState();

    if (widget.existingTask != null) {
      final existingTask = widget.existingTask!;
      titleController.text = existingTask.title;
      deadLineController.text = formatDate(existingTask.deadLine);
      selectedDate = existingTask.deadLine;
      selectedTimeOfDay = TimeOfDay.fromDateTime(existingTask.deadLine);
      selectedCategory = existingTask.categoryId;
    }

    dateController.text = formatDate(selectedDate);
    timeController.text = formatTime(selectedTimeOfDay);
  }

  void onCanceled() {
    Navigator.pop(context);
  }

  void onSaved() {
    if (selectedCategory == null) {
      return;
    }

    final doneTime = DateTime.now();

    final dateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTimeOfDay.hour,
      selectedTimeOfDay.minute,
    );

    final newTask = Task(
      id: widget.existingTask?.id ?? DateTime.now().toString(),
      title: titleController.text,
      deadLine: deadLineClearedText.isEmpty ? DateTime.now() : dateTime,
      doneTime: formatDateTime(doneTime),
      categoryId: selectedCategory!,
    );

    widget.onTaskCreated(newTask);
    Navigator.pop(context);
  }

  void clearDateTime() {
    setState(() {
      selectedDate = DateTime.now();
      selectedTimeOfDay = TimeOfDay.now();
      dateController.clear();
      timeController.clear();
      deadLineClearedText = '';
    });
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
        isDateSelected = true;
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
          isTimeSelected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 16, 16, bottomInset + 16),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            children: [
              Expanded(
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(label: Text('Add new task')),
                ),
              ),
              DropdownMenu(
                  expandedInsets: EdgeInsets.zero,
                  label: Text('Category'),
                  initialSelection: selectedCategory,
                  onSelected: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  dropdownMenuEntries: categories
                      .map((category) => DropdownMenuEntry(
                            value: category.id,
                            label: category.title,
                            leadingIcon: Icon(category.icon),
                          ))
                      .toList()),
              Expanded(
                child: TextField(
                  readOnly: true,
                  controller: dateController,
                  onTap: onDateTap,
                  onChanged: (value) => setState(() {
                    deadLineController.text = value;
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
                    deadLineController.text = value;
                  }),
                  decoration: InputDecoration(label: Text('Deadline Time')),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                  ),
                  onPressed: clearDateTime,
                  child: Text('Clear DeadLine'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onCanceled,
                      child: Text('Cancel'),
                    ),
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
      ),
    );
  }
}
