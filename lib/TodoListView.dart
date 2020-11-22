import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder_app/TodoList.dart';

import 'NewTodoView.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _topheader(context),
            _firstheader(context),
            Consumer<MyState>(
              builder: (context, state, child) => TodoList(state.list),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topheader(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Påminnelser',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              /*_popup(
                context,
              )*/
            ],
          ),
        ),
      ],
    );
  }

  /*Widget _popup(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Text('Alla'),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Text('Slutförda'),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Text('Oavslutade'),
            value: 'three',
          ),
        ],
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Alla'),
        value: _value,
        underline: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.red),
            ),
          ),
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }*/

  Widget _firstheader(BuildContext context) {
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
                                CircleAvatar(
                                  radius: 15.0,
                                  child: Icon(
                                    Icons.list,
                                    size: 22.0,
                                  ),
                                  backgroundColor: Colors.red[400],
                                  foregroundColor: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Att göra idag',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white70),
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () async {
                                var newCard = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NewTodoView(
                                      TodoCard(message: ''),
                                    ),
                                  ),
                                );
                                if (newCard != null) {
                                  Provider.of<MyState>(context, listen: false)
                                      .addCard(newCard);
                                }
                              },
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
