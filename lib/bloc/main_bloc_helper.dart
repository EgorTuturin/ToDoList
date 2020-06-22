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

//  Notes _notes;
//
//  MainBlocHelper(this._notes);

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

  // map current state to event for its dispatching
  static MainState state(MainEvent event) {
    if (event.toString() == "ToStart") {
      AppStarted toStart = event as AppStarted;
      return StartState();
    }
  }

  static addEvent(MainState state) {
    MainEvent _event = event(state);
    if (_event == null) print("NULL event from state " + state.toString());
    // check if the latest event it the same as current then do not add it
    if (eventQueue.isNotEmpty) {
      if (eventQueue.last != _event) {
        print("added event " + state.toString());
        eventQueue.add(_event);
      } else {
        print("tap the same screen");
      }
    } else {
      print("added event " + state.toString());
      eventQueue.add(_event);
    }
  }

  static addMainEvent(MainState state) {
    // check if the latest event it the same as current then do not add it
    if (mainEventQueue.isNotEmpty) {
      if (mainEventQueue.last != event(state)) {
        print("added event " + state.toString());
        mainEventQueue.add(event(state));
      } else {
        print("tap the same screen");
      }
    } else {
      print("added event " + state.toString());
      mainEventQueue.add(event(state));
    }
  }

  static addGroupEvent(MainState state) {
    // check if the latest event it the same as current then do not add it
    if (groupEventQueue.isNotEmpty) {
      if (groupEventQueue.last != event(state)) {
        print("added event " + state.toString());
        groupEventQueue.add(event(state));
      } else {
        print("tap the same screen");
      }
    } else {
      print("added event " + state.toString());
      groupEventQueue.add(event(state));
    }
  }

}