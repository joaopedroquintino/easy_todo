import 'package:easy_todo/app/features/tasks/presentation/tasks_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: TasksScreen(),
    );
  }
}
