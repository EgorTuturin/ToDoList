import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:himanchuapp/models/notes.dart';
import 'bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  Notes _notes;

  MainBloc({
    @required Notes notes,
  })  :_notes = notes;

  @override
  MainState get initialState => StartState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is AppStarted) {
      yield* _mapToStartToState();
    }
    if (event is ToStart) {
      yield* _mapToStartToState();
    }
    if (event is ToTask) {
      yield* _mapToTaskToState();
    }
  }


  Stream<MainState> _mapToStartToState() async* {
    yield StartState();
  }

  Stream<MainState> _mapToTaskToState() async* {
    yield TaskState();
  }

}