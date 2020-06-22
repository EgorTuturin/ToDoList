import 'package:equatable/equatable.dart';
import 'package:himanchuapp/models/notes.dart';

abstract class MainEvent extends Equatable {
  MainEvent([List props = const []]) : super(props);
}

class AppStarted extends MainEvent {

  @override
  String toString() => 'ToStart';
}

class ToStart extends MainEvent {

  @override
  String toString() => 'ToStart';
}

class ToTask extends MainEvent {

  @override
  String toString() => 'ToTask';
}