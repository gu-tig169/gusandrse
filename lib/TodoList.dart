import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/model.dart';

class TodoList extends StatefulWidget {
  final List<TodoCard> list;

  TodoList(this.list);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool _isChecked = false;

  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children: widget.list.map((card) => _cardItem(context, card)).toList());
  }

  Widget _cardItem(context, card) {
    return _todocard(context, card);
  }

  Widget _todocard(BuildContext context, card) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 30,
                                  child: Checkbox(
                                    value: _isChecked,
                                    activeColor: Colors.white30,
                                    checkColor: Colors.white,
                                    onChanged: (newCheckValue) {
                                      setState(
                                        () {
                                          _isChecked = newCheckValue;
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    card.message,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white54),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: IconButton(
                                icon: Icon(Icons.remove_rounded),
                                onPressed: () {
                                  var state = Provider.of<MyState>(context,
                                      listen: false);
                                  state.removeCard(card);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
