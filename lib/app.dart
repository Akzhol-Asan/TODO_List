import 'package:flutter/material.dart';
import 'package:to_do_list/screens/tasks_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO-List'),
      ),
      body: TasksScreen(),
    );
  }
}
