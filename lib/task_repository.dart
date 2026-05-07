import 'package:flutter/material.dart';

class Task {
  String title;
  String deadline;
  bool done;
  String priority;

  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority
  });
}

class TaskRepository {
  static List<Task> tasks = [
    Task(title: "Przygotować prezentację", deadline: "jutro", priority: "wysoki", done: false),
    Task(title: "Nauczyc grac sie na flecie", deadline: "dzisiaj", priority: "wysoki", done: true),
    Task(title: "Powtorzyc Jave", deadline: "w piątek", priority: "średni", done: false),
    Task(title: "Zadanie z matematyki", deadline: "w weekend", priority: "niski", done: false),
  ];
}