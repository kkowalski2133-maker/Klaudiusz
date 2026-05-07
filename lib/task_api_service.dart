import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'task_repository.dart';
class TaskApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse("$baseUrl/todos"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List todos = data["todos"];

      final random = Random();
      final priorities = ["niski", "średni", "wysoki"];
      final deadlines = ["dzisiaj", "jutro", "za tydzień"];

      return todos.map((todo) {
        final priority = priorities[random.nextInt(priorities.length)];
        final deadline = deadlines[random.nextInt(deadlines.length)];

        return Task(
          title: todo["todo"],
          deadline: deadline,
          done: todo["completed"],
          priority: priority,
        );
      }).toList();
    } else {
      throw Exception("Błąd pobierania danych z API.");
    }
  }
}