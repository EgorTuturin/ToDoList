import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:himanchuapp/bloc/bloc.dart';
import 'package:himanchuapp/models/notes.dart';

import 'bloc/main_bloc.dart';

class TaskForm extends StatefulWidget {
  Notes notes;

  TaskForm({Key key, Notes notes})
      : notes = notes,
        super(key: key);

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  Notes get notes => widget.notes;
  List<String> _todoItems = [];
  MainBloc _mainBloc;
  String taskDate = 'Today';
  String _noteInfo;
  var date;

  @override
  void initState() {
    _mainBloc = BlocProvider.of<MainBloc>(context);
    super.initState();
  }

  void _addTodoItem(String task) {
    if (task.length > 0) {
      _todoItems.add(task);
    }
  }

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      date = order;
    });
  }

  Future<DateTime> getDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a new task')),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                textInputAction: TextInputAction.done,
//              autofocus: true,
                onChanged: (val) {
                  _noteInfo = val;
                  print(_noteInfo);
                },
                decoration: InputDecoration(
//                  hintText: 'Enter something to do...',
                  contentPadding: EdgeInsets.all(16.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 56, 59, 64),
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 56, 59, 64),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Text(
            'When:',
            style: TextStyle(fontSize: 20),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: <Widget>[
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: taskDate == 'Today'
                   ? LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(199, 49, 121, 1),
                        Color.fromRGBO(235, 98, 80, 1),
                      ],
                    )
                    : LinearGradient(
                      colors: <Color>[
                        Colors.black,
                        Colors.black,
                      ]
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        taskDate = 'Today';
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Source Sans pro'),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: taskDate == 'Tomorrow'
                    ? LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(199, 49, 121, 1),
                        Color.fromRGBO(235, 98, 80, 1),
                      ],
                    )
                    : LinearGradient(
                      colors: <Color>[
                        Colors.black,
                        Colors.black,
                      ]
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        taskDate = 'Tomorrow';
                      });
                    },
                    splashColor: Colors.transparent,
                    child: Text(
                      'Tomorrow',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Source Sans pro'),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: taskDate == 'Other'
                    ? LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(199, 49, 121, 1),
                        Color.fromRGBO(235, 98, 80, 1),
                      ],
                    )
                    : LinearGradient(
                      colors: <Color>[
                        Colors.black,
                        Colors.black,
                      ]
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        taskDate = 'Other';
                      });
                      callDatePicker();
                    },
                    splashColor: Colors.transparent,
                    child: Text(
                      'Other',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Source Sans pro'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color.fromRGBO(199, 49, 121, 1),
                    Color.fromRGBO(235, 98, 80, 1),
                  ],
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FlatButton(
                onPressed: () {
                  print(_noteInfo);
                  print(DateTime.now().toString());
                  notes.addTodayNote(_noteInfo, DateTime.now());
                  print(notes.todayNotes[0].information);
                  _mainBloc.dispatch(ToStart());
                },
                splashColor: Colors.transparent,
                child: Text(
                  '+ Add Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Source Sans pro'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
