import 'package:flutter/foundation.dart';

import 'api.dart';

String hinttext = 'Alla';

class Todo {
  String message;
  bool check;
  String id;

  Todo({this.message, this.check = false, this.id});

  static Map<String, dynamic> toJson(Todo todo) {
    return {
      'title': todo.message,
      'done': todo.check,
    };
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      message: json['title'],
      check: json['done'],
      id: json['id'],
    );
  }
}

class MyState extends ChangeNotifier {
  Future getList() async {
    List<Todo> apiList = await Api.getTodos();
    _completeTodoList = apiList;
    notifyListeners();
  }

  String _filterValue = 'one';

  List<Todo> _completeTodoList = [];

  List<Todo> _filteredList;

  List<Todo> get completeTodoList => filtering(_completeTodoList, _filterValue);

  List<Todo> filtering(List<Todo> _completeTodoList, String _filterValue) {
    if (_filterValue == 'one') {
      _filteredList = _completeTodoList;
      hinttext = 'Alla';
    }
    if (_filterValue == 'two') {
      _filteredList =
          _completeTodoList.where((todo) => todo.check == true).toList();
      hinttext = 'Slutförda';
    }
    if (_filterValue == 'three') {
      _filteredList =
          _completeTodoList.where((todo) => todo.check == false).toList();
      hinttext = 'Oavslutade';
    }
    return _filteredList;
  }

  useFilterFunction() {
    notifyListeners();
    return filtering;
  }

  void setFilterValue(newValue) {
    _filterValue = newValue;
  }

  void setCheckbox(Todo todo, bool check) async {
    todo.check = check;
    await Api.updateTodo(todo, todo.id);
    notifyListeners();
  }

  void addTodo(Todo todo) async {
    await Api.addTodo(todo);
    await getList();
  }

  void removeTodo(Todo todo) async {
    await Api.removeTodo(todo.id);
    await getList();
  }
}
