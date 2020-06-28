import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:himanchuapp/models/notes.dart';
import '../list.dart';
import '../task.dart';
import 'bloc.dart';

class MainBlocHelper {
  static Queue<MainEvent> eventQueue = Queue();
  static Queue<MainEvent> mainEventQueue = Queue();
  static Queue<MainEvent> groupEventQueue = Queue();
  static Queue<MainEvent> stateQueue = Queue();

  Widget mainWidget(MainState state, Notes notes) {
    Widget widget;
    if (state.toString() == "StartState") {
      widget = ListForm(notes: notes,);
      return widget;
    }
    if (state.toString() == "TaskState") {
      widget = TaskForm(notes: notes);
      return widget;
    }
  }

  static MainEvent event(MainState state) {
    if (state.toString() == "StartState") {
      return AppStarted();
    }
  }
}