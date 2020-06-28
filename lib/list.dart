import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:himanchuapp/bloc/bloc.dart';
import 'package:himanchuapp/models/notes.dart';

import 'bloc/main_bloc.dart';

class ListForm extends StatefulWidget {
  Notes notes;

  ListForm({Key key, Notes notes})
      : notes = notes,
        super(key: key);

  @override
  _ListFormState createState() => _ListFormState();
}

class _ListFormState extends State<ListForm> {
  List<String> _todoItems = [];

  Notes get notes => widget.notes;
  MainBloc _mainBloc;

  @override
  void initState() {
    _mainBloc = BlocProvider.of<MainBloc>(context);
    super.initState();
  }

  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Mark "${_todoItems[index]}" as done?'),
              actions: <Widget>[
                FlatButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: Text('MARK AS DONE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _buildTodoItem(String todoText, int index) {
    return ListTile(
        title: Text(todoText), onTap: () => _promptRemoveTodoItem(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Tasks')),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  notes.todayNotes.forEach((note) {
                    print(note.information);
                  });
                },
                child: Text('Today'),
              ),
              SizedBox(width: 20),
              FlatButton(
                onPressed: () {},
                child: Text('Tomorrow'),
              ),
              SizedBox(width: 20),
              FlatButton(
                onPressed: () {},
                child: Text('Other'),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200,
              child: ListView.builder(
                  itemCount: notes.todayNotes.length,
                  itemBuilder: (context, index) {
                    return new Text(notes.todayNotes[index].information);
                  }),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
              onPressed: () {
                _mainBloc.dispatch(ToTask());
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
