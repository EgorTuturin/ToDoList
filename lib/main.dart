import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:himanchuapp/bloc/bloc.dart';
import 'package:himanchuapp/list.dart';

import 'models/notes.dart';

void main() async {



  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    BlocProvider(
      builder: (context) =>
      MainBloc()
        ..dispatch(AppStarted()),
      dispose: (context, bloc) => bloc.dispose(),
      child: TodoApp(),
    ),
  );
}




class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}


class _TodoAppState extends State<TodoApp> {
  MainBlocHelper _helper;
  MainBloc _mainBloc;
  Notes notes = Notes();

  @override
  void initState() {
    _mainBloc = BlocProvider.of<MainBloc>(context);
    _helper = MainBlocHelper();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _mainBloc,
      listener: (BuildContext context, MainState state) {},
      child: BlocBuilder(
          bloc: _mainBloc,
          builder: (BuildContext context, MainState state) {
            return MaterialApp(
              title: 'Todo List',
              home: _helper.mainWidget(state, notes),
            );
          }
      ),
    );
  }
}
