import 'package:flutter/material.dart';
import 'package:to_do_list/models/task.dart';
import 'package:to_do_list/screens/tasks_screen.dart';
import 'package:to_do_list/widgets/new_task.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<Task> tasks = [
    Task(
      title: 'Fix bugs and optimize performance',
      deadLine: DateTime.now(),
      doneTime: 'Done: 01.01.2025 / 10:00',
    ),
    Task(
      title: 'Review pull requests from teammates',
      deadLine: DateTime.now(),
      doneTime: 'Done: 01.01.2025 / 15:00',
    ),
    Task(
      title: 'Attend daily stand-up meetings',
      deadLine: DateTime.now(),
      doneTime: 'Done: 01.01.2025 / 12:00',
    ),
    Task(
      title: 'Deploy and monitor application. ',
      deadLine: DateTime.now(),
      doneTime: 'Done: 01.01.2025 / 17:00',
    ),
  ];

  void onTaskCreated(Task newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  void delete(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void addNewTask() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onTaskCreated: onTaskCreated),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(72, 72, 72, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              color: Colors.white,
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text(
              'TODO-List',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              iconSize: 30,
              color: Colors.white,
              onPressed: addNewTask,
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: TasksScreen(
        tasks: tasks,
        delete: delete,
      ),
    );
  }
}
