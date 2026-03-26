import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<Task> tasks = [
    Task(title: "Przygotować prezentację", deadline: "jutro", priority: "wysoki", done: false),
    Task(title: "Nauczyc grac sie na flecie", deadline: "dzisiaj", priority: "wysoki", done: true),
    Task(title: "Powtorzyc Jave", deadline: "w piątek", priority: "średni", done: false),
    Task(title: "Zadanie z matematyki", deadline: "w weekend", priority: "niski", done: false),
  ];

  @override
  Widget build(BuildContext context) {
    int completedTasks = tasks.where((task) => task.done).length;

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("KrakFlow"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Masz dziś ${tasks.length} zadania. Wykonano: $completedTasks"),
              SizedBox(height: 16),
              Text(
                "Dzisiejsze zadania",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return TaskCard(
                        title: tasks[index].title,
                        deadline: tasks[index].deadline,
                        priority: tasks[index].priority,
                        icon: tasks[index].done ? Icons.check_circle : Icons.radio_button_unchecked,
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Task {
  String title;
  String deadline;
  bool done;
  String priority;

  Task({required this.title, required this.deadline, required this.done, required this.priority});
}

class TaskCard extends StatelessWidget{
  final String title;
  final String deadline;
  final String priority;
  final IconData icon;

  const TaskCard({super.key, required this.title, required this.deadline, required this.priority, required this.icon});

  @override
  Widget build(BuildContext context){
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text("termin: $deadline | priorytet: $priority"),
      ),
    );
  }
}