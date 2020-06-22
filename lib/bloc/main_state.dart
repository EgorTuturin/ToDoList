import 'dart:core';
import 'package:equatable/equatable.dart';
import 'package:himanchuapp/models/notes.dart';

abstract class MainState extends Equatable {
  MainState([List props = const []]) : super(props);
}

class StartState extends MainState {

  @override
  String toString() => 'StartState';
}

class TaskState extends MainState {

  @override
  String toString() => 'TaskState';
}