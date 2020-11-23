import 'package:flutter/foundation.dart';

String hinttext = 'Alla';

class TodoCard {
  String message;
  bool check;

  TodoCard({this.message, this.check = false});
}

class MyState extends ChangeNotifier {
  String _filterValue = 'one';
  List<TodoCard> _list = [];

  //List<TodoCard> get list => _list;
  List<TodoCard> get list {
    return filtering(_list, _filterValue);
  }

  List<TodoCard> _filteredList;

  List<TodoCard> filtering(List<TodoCard> _list, String _filterValue) {
    if (_filterValue == 'one') {
      _filteredList = _list;
      hinttext = 'Alla';
    }
    if (_filterValue == 'two') {
      _filteredList = _list.where((card) => card.check == true).toList();
      hinttext = 'Slutförda';
    }
    if (_filterValue == 'three') {
      _filteredList = _list.where((card) => card.check == false).toList();
      hinttext = 'Oavslutade';
    }
    return _filteredList;
  }

  void addCard(TodoCard card) {
    _filterValue = 'one';
    _list.add(card);
    notifyListeners();
  }

  void removeCard(TodoCard card) {
    _list.remove(card);
    notifyListeners();
  }

  void setTake(TodoCard card, bool check) {
    card.check = check;
    notifyListeners();
  }

  void setFilterValue(newValue) {
    _filterValue = newValue;
  }

  useFilter() {
    notifyListeners();
    return filtering;
  }
}
