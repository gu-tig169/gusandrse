import 'package:flutter/foundation.dart';

class TodoCard {
  String message;
  bool check;

  TodoCard({this.message, this.check = false});
}

class MyState extends ChangeNotifier {
  List<TodoCard> _list = [];

  List<TodoCard> get list => _list;

  void addCard(TodoCard card) {
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
}
