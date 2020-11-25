import 'package:flutter/foundation.dart';

String hinttext = 'Alla';

class Todo {
  String message;
  bool check;

  Todo({this.message, this.check = false});
}

class MyState extends ChangeNotifier {
  String _filterValue = 'one';

  List<Todo> _completeTodoList = new List();
  List<Todo> _filteredList;

  List get completeTodoList => filtering(_completeTodoList, _filterValue);

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

  void addCard(Todo todo) {
    _filterValue = 'one';
    _completeTodoList.add(todo);
    notifyListeners();
  }

  void removeCard(Todo todo) {
    _completeTodoList.remove(todo);
    notifyListeners();
  }

  void setCheckbox(Todo todo, bool check) {
    todo.check = check;
    notifyListeners();
  }
}
