import 'dart:convert';

import 'package:reminder_app/model.dart';

import 'model.dart';
import 'package:http/http.dart' as http;

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY =
    '70593ea6-22bf-46b5-85d3-5cb383295130'; // Sätt ny API nyckel om den inte längre fungerar

class Api {
  static Future addTodo(Todo todo) async {
    var json = jsonEncode(Todo.toJson(todo));
    print(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('done');
  }

  static Future updateTodo(Todo todo, String todoId) async {
    var json = jsonEncode(Todo.toJson(todo));
    print(json);
    await http.put(
      '$API_URL/todos/$todoId?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('update done');
  }

  static Future removeTodo(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future<List<Todo>> getTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    print(response.body);
    var json = jsonDecode(response.body);
    print(json);

    return json.map<Todo>((data) {
      return Todo.fromJson(data);
    }).toList();
  }
}
