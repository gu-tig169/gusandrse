import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/model.dart';

class TodoList extends StatelessWidget {
  final List<Todo> completeTodoList;

  TodoList(this.completeTodoList);

  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children:
            completeTodoList.map((todo) => _todoCard(context, todo)).toList());
  }

  Widget _todoCard(BuildContext context, todo) {
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
                                    value: todo.check,
                                    activeColor: Colors.white30,
                                    checkColor: Colors.white,
                                    onChanged: (bool newValue) {
                                      var state = Provider.of<MyState>(context,
                                          listen: false);
                                      state.setCheckbox(todo, newValue);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    todo.message,
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
                                  state.removeTodo(todo);
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
